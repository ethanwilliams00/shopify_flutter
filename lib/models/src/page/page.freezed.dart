// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Page _$PageFromJson(Map<String, dynamic> json) {
  return _Page.fromJson(json);
}

/// @nodoc
mixin _$Page {
  String get body => throw _privateConstructorUsedError;
  String get bodySummary => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get handle => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageCopyWith<Page> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageCopyWith<$Res> {
  factory $PageCopyWith(Page value, $Res Function(Page) then) =
      _$PageCopyWithImpl<$Res, Page>;
  @useResult
  $Res call(
      {String body,
      String bodySummary,
      DateTime createdAt,
      String handle,
      String id,
      String title,
      DateTime updatedAt});
}

/// @nodoc
class _$PageCopyWithImpl<$Res, $Val extends Page>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? bodySummary = null,
    Object? createdAt = null,
    Object? handle = null,
    Object? id = null,
    Object? title = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      bodySummary: null == bodySummary
          ? _value.bodySummary
          : bodySummary // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$$_PageCopyWith(_$_Page value, $Res Function(_$_Page) then) =
      __$$_PageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String body,
      String bodySummary,
      DateTime createdAt,
      String handle,
      String id,
      String title,
      DateTime updatedAt});
}

/// @nodoc
class __$$_PageCopyWithImpl<$Res> extends _$PageCopyWithImpl<$Res, _$_Page>
    implements _$$_PageCopyWith<$Res> {
  __$$_PageCopyWithImpl(_$_Page _value, $Res Function(_$_Page) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = null,
    Object? bodySummary = null,
    Object? createdAt = null,
    Object? handle = null,
    Object? id = null,
    Object? title = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_Page(
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      bodySummary: null == bodySummary
          ? _value.bodySummary
          : bodySummary // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      handle: null == handle
          ? _value.handle
          : handle // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Page extends _Page {
  _$_Page(
      {required this.body,
      required this.bodySummary,
      required this.createdAt,
      required this.handle,
      required this.id,
      required this.title,
      required this.updatedAt})
      : super._();

  factory _$_Page.fromJson(Map<String, dynamic> json) => _$$_PageFromJson(json);

  @override
  final String body;
  @override
  final String bodySummary;
  @override
  final DateTime createdAt;
  @override
  final String handle;
  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Page(body: $body, bodySummary: $bodySummary, createdAt: $createdAt, handle: $handle, id: $id, title: $title, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Page &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.bodySummary, bodySummary) ||
                other.bodySummary == bodySummary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.handle, handle) || other.handle == handle) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, body, bodySummary, createdAt, handle, id, title, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageCopyWith<_$_Page> get copyWith =>
      __$$_PageCopyWithImpl<_$_Page>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PageToJson(
      this,
    );
  }
}

abstract class _Page extends Page {
  factory _Page(
      {required final String body,
      required final String bodySummary,
      required final DateTime createdAt,
      required final String handle,
      required final String id,
      required final String title,
      required final DateTime updatedAt}) = _$_Page;
  _Page._() : super._();

  factory _Page.fromJson(Map<String, dynamic> json) = _$_Page.fromJson;

  @override
  String get body;
  @override
  String get bodySummary;
  @override
  DateTime get createdAt;
  @override
  String get handle;
  @override
  String get id;
  @override
  String get title;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PageCopyWith<_$_Page> get copyWith => throw _privateConstructorUsedError;
}
