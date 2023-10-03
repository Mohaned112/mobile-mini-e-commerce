import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(failureMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(failureMessage: 'Wrong password'));
      }
    } catch (e) {
      emit(LoginFailure(
          failureMessage: 'Something went wrong... please try again'));
    }
  }

  Future<void> registerUser(String email, String password) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFailure(failureMessage: 'Weak password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailure(failureMessage: 'Email already in use'));
      }
    } catch (e) {
      emit(RegisterFailure(
          failureMessage: 'Something went wrong... please try  again'));
    }
  }
}
