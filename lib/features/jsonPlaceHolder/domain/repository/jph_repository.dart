import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/error/app_error.dart';
import 'package:flutter_base/features/jsonPlaceHolder/data/models/posts.dart';

abstract class JphRepository {
  Future<Either<AppError, List<Posts>>> fetchPosts();
}
