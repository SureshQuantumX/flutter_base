import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/api/api_call_with_error.dart';
import 'package:flutter_base/core/error/app_error.dart';
import 'package:flutter_base/features/jsonPlaceHolder/data/data_source/jph_remote_data_source.dart';
import 'package:flutter_base/features/jsonPlaceHolder/data/models/posts.dart';
import 'package:flutter_base/features/jsonPlaceHolder/domain/repository/jph_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: JphRepository)
class JphRepositoryImpl implements JphRepository {
  final JphRemoteDataSource remoteDataSource;

  JphRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError, List<Posts>>> fetchPosts() {
    return ApiCallWithError.call(() => remoteDataSource.fetchPosts());
  }
}
