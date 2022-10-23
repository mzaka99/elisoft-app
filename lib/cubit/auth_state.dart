// ignore_for_file: must_be_immutable

part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  const AuthSuccess();

  @override
  List<Object> get props => [];
}

class AuthFailed extends AuthState {
  final Failure failure;
  const AuthFailed({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
