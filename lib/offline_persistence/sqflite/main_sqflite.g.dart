// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_sqflite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  id: json['id'] as String,
  description: json['description'] as String,
  completed: json['completed'] as bool,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'id': instance.id,
  'description': instance.description,
  'completed': instance.completed,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storage)
final storageProvider = StorageProvider._();

final class StorageProvider
    extends
        $FunctionalProvider<
          AsyncValue<JsonSqFliteStorage>,
          JsonSqFliteStorage,
          FutureOr<JsonSqFliteStorage>
        >
    with
        $FutureModifier<JsonSqFliteStorage>,
        $FutureProvider<JsonSqFliteStorage> {
  StorageProvider._()
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
  $FutureProviderElement<JsonSqFliteStorage> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<JsonSqFliteStorage> create(Ref ref) {
    return storage(ref);
  }
}

String _$storageHash() => r'28e1500233865b39d360dae9d516b1eb9a82d2e7';

@ProviderFor(TodosNotifier)
@JsonPersist()
final todosProvider = TodosNotifierProvider._();

@JsonPersist()
final class TodosNotifierProvider
    extends $AsyncNotifierProvider<TodosNotifier, List<Todo>> {
  TodosNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosNotifierHash();

  @$internal
  @override
  TodosNotifier create() => TodosNotifier();
}

String _$todosNotifierHash() => r'3411cdb9c272972c0e64d3a0cebad354cda5c44c';

@JsonPersist()
abstract class _$TodosNotifierBase extends $AsyncNotifier<List<Todo>> {
  FutureOr<List<Todo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Todo>>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Todo>>, List<Todo>>,
              AsyncValue<List<Todo>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
abstract class _$TodosNotifier extends _$TodosNotifierBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "TodosNotifier";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<Todo> state)? encode,
    List<Todo> Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    return NotifierPersistX(this).persist<String, String>(
      storage,
      key: key ?? this.key,
      encode: encode ?? $jsonCodex.encode,
      decode:
          decode ??
          (encoded) {
            final e = $jsonCodex.decode(encoded);
            return (e as List)
                .map((e) => Todo.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
