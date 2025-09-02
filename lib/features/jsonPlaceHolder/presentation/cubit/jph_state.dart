part of 'jph_cubit.dart';

sealed class JphState extends Equatable {
  const JphState();

  @override
  List<Object> get props => [];
}

final class JphInitial extends JphState {}

final class JphLoading extends JphState {}

final class JphLoaded extends JphState {
  final List<Posts> posts;

  const JphLoaded(this.posts);
}

final class JphError extends JphState {
  final AppError error;
  const JphError(this.error);
}
