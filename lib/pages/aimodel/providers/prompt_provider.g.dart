// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryNotifierHash() => r'5ce4b6de390c2346a10d1bdcba1f712573f360d5';

/// See also [CategoryNotifier].
@ProviderFor(CategoryNotifier)
final categoryNotifierProvider =
    AutoDisposeNotifierProvider<CategoryNotifier, String>.internal(
  CategoryNotifier.new,
  name: r'categoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryNotifier = AutoDisposeNotifier<String>;
String _$keywordNotifierHash() => r'14230746cde6f4eed2105179e39e2a206f1edba3';

/// See also [KeywordNotifier].
@ProviderFor(KeywordNotifier)
final keywordNotifierProvider =
    AutoDisposeNotifierProvider<KeywordNotifier, String>.internal(
  KeywordNotifier.new,
  name: r'keywordNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keywordNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KeywordNotifier = AutoDisposeNotifier<String>;
String _$promptNotifierHash() => r'3d359963a2265325a27121b61e212ec0a16ca365';

/// See also [PromptNotifier].
@ProviderFor(PromptNotifier)
final promptNotifierProvider = AutoDisposeAsyncNotifierProvider<PromptNotifier,
    PagePagingData<PromptRes>>.internal(
  PromptNotifier.new,
  name: r'promptNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promptNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PromptNotifier = AutoDisposeAsyncNotifier<PagePagingData<PromptRes>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
