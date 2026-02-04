part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  String message;
  AuthSuccess(this.message);
}

class AuthError extends AuthState {
  String message;
  AuthError(this.message);
}
