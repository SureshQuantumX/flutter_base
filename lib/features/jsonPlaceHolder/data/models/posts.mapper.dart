// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'posts.dart';

class PostsMapper extends ClassMapperBase<Posts> {
  PostsMapper._();

  static PostsMapper? _instance;
  static PostsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PostsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Posts';

  static int _$userId(Posts v) => v.userId;
  static const Field<Posts, int> _f$userId = Field('userId', _$userId);
  static int _$id(Posts v) => v.id;
  static const Field<Posts, int> _f$id = Field('id', _$id);
  static String _$title(Posts v) => v.title;
  static const Field<Posts, String> _f$title = Field('title', _$title);
  static String _$body(Posts v) => v.body;
  static const Field<Posts, String> _f$body = Field('body', _$body);

  @override
  final MappableFields<Posts> fields = const {
    #userId: _f$userId,
    #id: _f$id,
    #title: _f$title,
    #body: _f$body,
  };

  static Posts _instantiate(DecodingData data) {
    return Posts(data.dec(_f$userId), data.dec(_f$id), data.dec(_f$title),
        data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static Posts fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Posts>(map);
  }

  static Posts fromJson(String json) {
    return ensureInitialized().decodeJson<Posts>(json);
  }
}

mixin PostsMappable {
  String toJson() {
    return PostsMapper.ensureInitialized().encodeJson<Posts>(this as Posts);
  }

  Map<String, dynamic> toMap() {
    return PostsMapper.ensureInitialized().encodeMap<Posts>(this as Posts);
  }

  PostsCopyWith<Posts, Posts, Posts> get copyWith =>
      _PostsCopyWithImpl<Posts, Posts>(this as Posts, $identity, $identity);
  @override
  String toString() {
    return PostsMapper.ensureInitialized().stringifyValue(this as Posts);
  }

  @override
  bool operator ==(Object other) {
    return PostsMapper.ensureInitialized().equalsValue(this as Posts, other);
  }

  @override
  int get hashCode {
    return PostsMapper.ensureInitialized().hashValue(this as Posts);
  }
}

extension PostsValueCopy<$R, $Out> on ObjectCopyWith<$R, Posts, $Out> {
  PostsCopyWith<$R, Posts, $Out> get $asPosts =>
      $base.as((v, t, t2) => _PostsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PostsCopyWith<$R, $In extends Posts, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? userId, int? id, String? title, String? body});
  PostsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PostsCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Posts, $Out>
    implements PostsCopyWith<$R, Posts, $Out> {
  _PostsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Posts> $mapper = PostsMapper.ensureInitialized();
  @override
  $R call({int? userId, int? id, String? title, String? body}) =>
      $apply(FieldCopyWithData({
        if (userId != null) #userId: userId,
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (body != null) #body: body
      }));
  @override
  Posts $make(CopyWithData data) => Posts(
      data.get(#userId, or: $value.userId),
      data.get(#id, or: $value.id),
      data.get(#title, or: $value.title),
      data.get(#body, or: $value.body));

  @override
  PostsCopyWith<$R2, Posts, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PostsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
