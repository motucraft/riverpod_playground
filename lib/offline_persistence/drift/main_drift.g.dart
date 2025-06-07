// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_drift.dart';

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

@ProviderFor(TodosNotifier)
@JsonPersist()
const todosNotifierProvider = TodosNotifierProvider._();

final class TodosNotifierProvider
    extends $AsyncNotifierProvider<TodosNotifier, List<Todo>> {
  const TodosNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosNotifierHash();

  @$internal
  @override
  TodosNotifier create() => TodosNotifier();

  @$internal
  @override
  $AsyncNotifierProviderElement<TodosNotifier, List<Todo>> $createElement(
    $ProviderPointer pointer,
  ) => $AsyncNotifierProviderElement(pointer);
}

String _$todosNotifierHash() => r'f7c580875a00ab559ff61cbd0f6986fe1fd515e6';

abstract class _$TodosNotifierBase extends $AsyncNotifier<List<Todo>> {
  FutureOr<List<Todo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Todo>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Todo>>>,
              AsyncValue<List<Todo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// JsonGenerator
// **************************************************************************

abstract class _$TodosNotifier extends _$TodosNotifierBase
    with Persistable<List<Todo>, String, String> {
  @override
  FutureOr<void> persist({
    String? key,
    required FutureOr<Storage<String, String>> storage,
    String Function(List<Todo> state)? encode,
    List<Todo> Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    const resolvedKey = "TodosNotifier";

    return super.persist(
      key: key ?? resolvedKey,
      storage: storage,
      encode: encode ?? (value) => $jsonCodex.encode(state.requireValue),
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
