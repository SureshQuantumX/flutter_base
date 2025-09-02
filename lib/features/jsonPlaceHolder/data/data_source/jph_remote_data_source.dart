import 'package:flutter_base/config/constants/api_constants/api_constants.dart';
import 'package:flutter_base/core/api/api_client.dart';
import 'package:flutter_base/features/jsonPlaceHolder/data/models/posts.dart';
import 'package:injectable/injectable.dart';

abstract class JphRemoteDataSource {
  Future<List<Posts>> fetchPosts();
}

@LazySingleton(as: JphRemoteDataSource)
class JphRemoteDataSourceImpl implements JphRemoteDataSource {
  final ApiClient apiClient;

  JphRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<Posts>> fetchPosts() {
    return apiClient.get(ApiConstants.posts).then((data) {
      final List<Posts> posts = (data as List)
          .map((e) => PostsMapper.fromMap(e))
          .toList();
      return posts;
    });
  }
}
