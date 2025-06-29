import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/v7.dart';

import '../sqflite/main_sqflite.dart';

part 'main_drift.freezed.dart';
part 'main_drift.g.dart';

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

@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String description,
    required bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}

@riverpod
@JsonPersist()
class TodosNotifier extends _$TodosNotifier {
  @override
  FutureOr<List<Todo>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    );

    return state.value ?? [];
  }

  Future<void> add(Todo todo) async {
    state = AsyncData([...await future, todo]);
  }
}
