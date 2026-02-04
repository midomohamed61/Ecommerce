import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  void login({required String username, required String password}) async{
    emit(AuthLoading());
    final Either<String, LoginResponseModel> res = await authRepo.login(username, password);
    res.fold((error){
      emit(AuthError(error));
    }, (success){
      emit(AuthSuccess('Login Success'));
    });
  }
}
