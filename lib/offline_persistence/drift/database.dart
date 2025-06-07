import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

class JsonCacheTable extends Table {
  TextColumn get key => text()();
  TextColumn get jsonValue => text()();
  TextColumn get destroyKey => text().nullable()();
  DateTimeColumn get expireAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [JsonCacheTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'offline_persistence_drift.db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}

class DriftStorage implements Storage<String, String> {
  DriftStorage(this._db);

  final AppDatabase _db;

  @override
  FutureOr<PersistedData<String>?> read(String key) async {
    final row = await (_db.select(
      _db.jsonCacheTable,
    )..where((t) => t.key.equals(key))).getSingleOrNull();
    if (row == null) return null;

    return PersistedData(
      row.jsonValue,
      destroyKey: row.destroyKey,
      expireAt: row.expireAt,
    );
  }

  @override
  FutureOr<void> write(String key, String value, StorageOptions options) async {
    final now = clock.now().toUtc();
    final expire = options.cacheTime.duration == null
        ? null
        : now.add(options.cacheTime.duration!);

    await _db
        .into(_db.jsonCacheTable)
        .insertOnConflictUpdate(
          JsonCacheTableCompanion(
            key: Value(key),
            jsonValue: Value(value),
            destroyKey: Value(options.destroyKey),
            expireAt: Value(expire),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  FutureOr<void> delete(String key) async {
    await (_db.delete(
      _db.jsonCacheTable,
    )..where((t) => t.key.equals(key))).go();
  }
}

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) => AppDatabase();

@riverpod
DriftStorage storage(Ref ref) => DriftStorage(ref.watch(databaseProvider));
