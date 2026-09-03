import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_lms/bloc/auth/auth_event.dart';
import 'package:my_lms/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthStateChange>(_onAuthStateChanged);
    on<RegisterUserEvent>(_onRegisterUserEvent);
    on<LoginUserEvent>(_onLoginUserEvent);
    on<LogoutUserEvent>(_onLogoutUserEvent);
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
    on<ForgotPasswordEvent>(_onForgotPasswordEvent);
  }

  Future<void> _onAuthStateChanged(AuthStateChange event,
      Emitter<AuthState> emit,) async {
    emit(const AuthState());
  }

  Future<void> _onRegisterUserEvent(RegisterUserEvent event,
      Emitter<AuthState> emit,) async {
    try {
      emit(state.copyWith(isLoading: true));
      // register user function
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onLoginUserEvent(LoginUserEvent event,
      Emitter<AuthState> emit,) async {
    try {
      emit(state.copyWith(isLoading: true));
      // login user function
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  Future<void> _onLogoutUserEvent(LogoutUserEvent event,
      Emitter<AuthState> emit,) async {
    try{
      //logout functionality
      emit(const AuthState());
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
  Future<void> _onUpdateProfileEvent(UpdateProfileEvent event,
      Emitter<AuthState> emit,) async {
    try{
      emit(state.copyWith(isLoading: true));
      //update profile functionality
      emit(state.copyWith(isLoading: false));
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
  Future<void> _onForgotPasswordEvent(ForgotPasswordEvent event,
      Emitter<AuthState> emit,) async {
    try{
      emit(state.copyWith(isLoading: true));
      //forgot password functionality
      emit(state.copyWith(isLoading: false));
    }catch(e){
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
