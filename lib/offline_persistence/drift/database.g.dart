// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $JsonCacheTableTable extends JsonCacheTable
    with TableInfo<$JsonCacheTableTable, JsonCacheTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JsonCacheTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jsonValueMeta = const VerificationMeta(
    'jsonValue',
  );
  @override
  late final GeneratedColumn<String> jsonValue = GeneratedColumn<String>(
    'json_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destroyKeyMeta = const VerificationMeta(
    'destroyKey',
  );
  @override
  late final GeneratedColumn<String> destroyKey = GeneratedColumn<String>(
    'destroy_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expireAtMeta = const VerificationMeta(
    'expireAt',
  );
  @override
  late final GeneratedColumn<DateTime> expireAt = GeneratedColumn<DateTime>(
    'expire_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    jsonValue,
    destroyKey,
    expireAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'json_cache_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<JsonCacheTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('json_value')) {
      context.handle(
        _jsonValueMeta,
        jsonValue.isAcceptableOrUnknown(data['json_value']!, _jsonValueMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonValueMeta);
    }
    if (data.containsKey('destroy_key')) {
      context.handle(
        _destroyKeyMeta,
        destroyKey.isAcceptableOrUnknown(data['destroy_key']!, _destroyKeyMeta),
      );
    }
    if (data.containsKey('expire_at')) {
      context.handle(
        _expireAtMeta,
        expireAt.isAcceptableOrUnknown(data['expire_at']!, _expireAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  JsonCacheTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JsonCacheTableData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      jsonValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_value'],
      )!,
      destroyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destroy_key'],
      ),
      expireAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expire_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $JsonCacheTableTable createAlias(String alias) {
    return $JsonCacheTableTable(attachedDatabase, alias);
  }
}

class JsonCacheTableData extends DataClass
    implements Insertable<JsonCacheTableData> {
  final String key;
  final String jsonValue;
  final String? destroyKey;
  final DateTime? expireAt;
  final DateTime updatedAt;
  const JsonCacheTableData({
    required this.key,
    required this.jsonValue,
    this.destroyKey,
    this.expireAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['json_value'] = Variable<String>(jsonValue);
    if (!nullToAbsent || destroyKey != null) {
      map['destroy_key'] = Variable<String>(destroyKey);
    }
    if (!nullToAbsent || expireAt != null) {
      map['expire_at'] = Variable<DateTime>(expireAt);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  JsonCacheTableCompanion toCompanion(bool nullToAbsent) {
    return JsonCacheTableCompanion(
      key: Value(key),
      jsonValue: Value(jsonValue),
      destroyKey: destroyKey == null && nullToAbsent
          ? const Value.absent()
          : Value(destroyKey),
      expireAt: expireAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expireAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory JsonCacheTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JsonCacheTableData(
      key: serializer.fromJson<String>(json['key']),
      jsonValue: serializer.fromJson<String>(json['jsonValue']),
      destroyKey: serializer.fromJson<String?>(json['destroyKey']),
      expireAt: serializer.fromJson<DateTime?>(json['expireAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'jsonValue': serializer.toJson<String>(jsonValue),
      'destroyKey': serializer.toJson<String?>(destroyKey),
      'expireAt': serializer.toJson<DateTime?>(expireAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  JsonCacheTableData copyWith({
    String? key,
    String? jsonValue,
    Value<String?> destroyKey = const Value.absent(),
    Value<DateTime?> expireAt = const Value.absent(),
    DateTime? updatedAt,
  }) => JsonCacheTableData(
    key: key ?? this.key,
    jsonValue: jsonValue ?? this.jsonValue,
    destroyKey: destroyKey.present ? destroyKey.value : this.destroyKey,
    expireAt: expireAt.present ? expireAt.value : this.expireAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  JsonCacheTableData copyWithCompanion(JsonCacheTableCompanion data) {
    return JsonCacheTableData(
      key: data.key.present ? data.key.value : this.key,
      jsonValue: data.jsonValue.present ? data.jsonValue.value : this.jsonValue,
      destroyKey: data.destroyKey.present
          ? data.destroyKey.value
          : this.destroyKey,
      expireAt: data.expireAt.present ? data.expireAt.value : this.expireAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JsonCacheTableData(')
          ..write('key: $key, ')
          ..write('jsonValue: $jsonValue, ')
          ..write('destroyKey: $destroyKey, ')
          ..write('expireAt: $expireAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(key, jsonValue, destroyKey, expireAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JsonCacheTableData &&
          other.key == this.key &&
          other.jsonValue == this.jsonValue &&
          other.destroyKey == this.destroyKey &&
          other.expireAt == this.expireAt &&
          other.updatedAt == this.updatedAt);
}

class JsonCacheTableCompanion extends UpdateCompanion<JsonCacheTableData> {
  final Value<String> key;
  final Value<String> jsonValue;
  final Value<String?> destroyKey;
  final Value<DateTime?> expireAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const JsonCacheTableCompanion({
    this.key = const Value.absent(),
    this.jsonValue = const Value.absent(),
    this.destroyKey = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JsonCacheTableCompanion.insert({
    required String key,
    required String jsonValue,
    this.destroyKey = const Value.absent(),
    this.expireAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       jsonValue = Value(jsonValue);
  static Insertable<JsonCacheTableData> custom({
    Expression<String>? key,
    Expression<String>? jsonValue,
    Expression<String>? destroyKey,
    Expression<DateTime>? expireAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (jsonValue != null) 'json_value': jsonValue,
      if (destroyKey != null) 'destroy_key': destroyKey,
      if (expireAt != null) 'expire_at': expireAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JsonCacheTableCompanion copyWith({
    Value<String>? key,
    Value<String>? jsonValue,
    Value<String?>? destroyKey,
    Value<DateTime?>? expireAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return JsonCacheTableCompanion(
      key: key ?? this.key,
      jsonValue: jsonValue ?? this.jsonValue,
      destroyKey: destroyKey ?? this.destroyKey,
      expireAt: expireAt ?? this.expireAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (jsonValue.present) {
      map['json_value'] = Variable<String>(jsonValue.value);
    }
    if (destroyKey.present) {
      map['destroy_key'] = Variable<String>(destroyKey.value);
    }
    if (expireAt.present) {
      map['expire_at'] = Variable<DateTime>(expireAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JsonCacheTableCompanion(')
          ..write('key: $key, ')
          ..write('jsonValue: $jsonValue, ')
          ..write('destroyKey: $destroyKey, ')
          ..write('expireAt: $expireAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JsonCacheTableTable jsonCacheTable = $JsonCacheTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [jsonCacheTable];
}

typedef $$JsonCacheTableTableCreateCompanionBuilder =
    JsonCacheTableCompanion Function({
      required String key,
      required String jsonValue,
      Value<String?> destroyKey,
      Value<DateTime?> expireAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$JsonCacheTableTableUpdateCompanionBuilder =
    JsonCacheTableCompanion Function({
      Value<String> key,
      Value<String> jsonValue,
      Value<String?> destroyKey,
      Value<DateTime?> expireAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$JsonCacheTableTableFilterComposer
    extends Composer<_$AppDatabase, $JsonCacheTableTable> {
  $$JsonCacheTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsonValue => $composableBuilder(
    column: $table.jsonValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destroyKey => $composableBuilder(
    column: $table.destroyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expireAt => $composableBuilder(
    column: $table.expireAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JsonCacheTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JsonCacheTableTable> {
  $$JsonCacheTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jsonValue => $composableBuilder(
    column: $table.jsonValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destroyKey => $composableBuilder(
    column: $table.destroyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expireAt => $composableBuilder(
    column: $table.expireAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JsonCacheTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JsonCacheTableTable> {
  $$JsonCacheTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get jsonValue =>
      $composableBuilder(column: $table.jsonValue, builder: (column) => column);

  GeneratedColumn<String> get destroyKey => $composableBuilder(
    column: $table.destroyKey,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expireAt =>
      $composableBuilder(column: $table.expireAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JsonCacheTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JsonCacheTableTable,
          JsonCacheTableData,
          $$JsonCacheTableTableFilterComposer,
          $$JsonCacheTableTableOrderingComposer,
          $$JsonCacheTableTableAnnotationComposer,
          $$JsonCacheTableTableCreateCompanionBuilder,
          $$JsonCacheTableTableUpdateCompanionBuilder,
          (
            JsonCacheTableData,
            BaseReferences<
              _$AppDatabase,
              $JsonCacheTableTable,
              JsonCacheTableData
            >,
          ),
          JsonCacheTableData,
          PrefetchHooks Function()
        > {
  $$JsonCacheTableTableTableManager(
    _$AppDatabase db,
    $JsonCacheTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JsonCacheTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JsonCacheTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JsonCacheTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> jsonValue = const Value.absent(),
                Value<String?> destroyKey = const Value.absent(),
                Value<DateTime?> expireAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JsonCacheTableCompanion(
                key: key,
                jsonValue: jsonValue,
                destroyKey: destroyKey,
                expireAt: expireAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String jsonValue,
                Value<String?> destroyKey = const Value.absent(),
                Value<DateTime?> expireAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JsonCacheTableCompanion.insert(
                key: key,
                jsonValue: jsonValue,
                destroyKey: destroyKey,
                expireAt: expireAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JsonCacheTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JsonCacheTableTable,
      JsonCacheTableData,
      $$JsonCacheTableTableFilterComposer,
      $$JsonCacheTableTableOrderingComposer,
      $$JsonCacheTableTableAnnotationComposer,
      $$JsonCacheTableTableCreateCompanionBuilder,
      $$JsonCacheTableTableUpdateCompanionBuilder,
      (
        JsonCacheTableData,
        BaseReferences<_$AppDatabase, $JsonCacheTableTable, JsonCacheTableData>,
      ),
      JsonCacheTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JsonCacheTableTableTableManager get jsonCacheTable =>
      $$JsonCacheTableTableTableManager(_db, _db.jsonCacheTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(database)
const databaseProvider = DatabaseProvider._();

final class DatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const DatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return database(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$databaseHash() => r'd6e05638b723b0524e474cecb5226cbaac2e507a';

@ProviderFor(storage)
const storageProvider = StorageProvider._();

final class StorageProvider
    extends $FunctionalProvider<DriftStorage, DriftStorage, DriftStorage>
    with $Provider<DriftStorage> {
  const StorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageHash();

  @$internal
  @override
  $ProviderElement<DriftStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DriftStorage create(Ref ref) {
    return storage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DriftStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DriftStorage>(value),
    );
  }
}

String _$storageHash() => r'1b13665d2748323678c6f4e6639b6bb07ae57623';
