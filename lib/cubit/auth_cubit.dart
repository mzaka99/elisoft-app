import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_elisoft/constants/constants.dart';
import 'package:flutter_elisoft/models/failure_model.dart';
import 'package:flutter_elisoft/models/user_model.dart';
import 'package:flutter_elisoft/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  UserModel? dataUser;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      emit(const AuthFailed(failure: Failure(message: 'Email cant Empty')));
    } else if (password.isEmpty) {
      emit(const AuthFailed(failure: Failure(message: 'Password cant Empty')));
    } else if (!RegExp(emailPatern).hasMatch(email)) {
      emit(const AuthFailed(
          failure: Failure(message: 'Email must be a valid email address.')));
    } else if (password.length < 5) {
      emit(const AuthFailed(
          failure:
              Failure(message: 'Password must be at least 5 characters.')));
    } else {
      emit(AuthLoading());
      try {
        final UserModel? userModel =
            await AuthRepository().login(email: email, password: password);
        emit(const AuthSuccess());
        dataUser = userModel;
      } on Failure catch (e) {
        emit(AuthFailed(failure: e));
      } catch (e) {
        rethrow;
      }
    }
  }

  void whenError() {
    emit(AuthInitial());
  }
}
