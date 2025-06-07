import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/v7.dart';

part 'main_sqflite.g.dart';
part 'main_sqflite.freezed.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OfflinePersistenceExample());
  }
}

class OfflinePersistenceExample extends ConsumerWidget {
  const OfflinePersistenceExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todosNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: todosAsync.when(
          data: (todos) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: todos.map((t) {
                return ListTile(
                  title: FittedBox(child: Text(t.id)),
                  subtitle: Text(t.description),
                );
              }).toList(),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = const UuidV7().generate();
          ref
              .read(todosNotifierProvider.notifier)
              .add(Todo(id: id, description: 'New Todo', completed: false));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

@riverpod
Future<JsonSqFliteStorage> storage(Ref ref) async {
  return JsonSqFliteStorage.open(
    join(await getDatabasesPath(), 'offline_persistence_sqflite.db'),
  );
}

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String description,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

@riverpod
@JsonPersist()
class TodosNotifier extends _$TodosNotifier {
  @override
  FutureOr<List<Todo>> build() async {
    await persist(
      storage: ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    );

    return state.value ?? [];
  }

  Future<void> add(Todo todo) async {
    state = AsyncData([...await future, todo]);
  }
}
