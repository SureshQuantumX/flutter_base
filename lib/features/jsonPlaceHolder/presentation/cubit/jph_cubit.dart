import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/error/app_error.dart';
import 'package:flutter_base/features/jsonPlaceHolder/data/models/posts.dart';
import 'package:flutter_base/features/jsonPlaceHolder/domain/repository/jph_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'jph_state.dart';

@injectable
class JphCubit extends Cubit<JphState> {
  JphCubit(this.repository) : super(JphInitial());

  final JphRepository repository;
  Future<void> fetchPosts() async {
    emit(JphLoading());
    final res = await repository.fetchPosts();
    emit(res.fold((l) => JphError(l), (r) => JphLoaded(r)));
  }
}
