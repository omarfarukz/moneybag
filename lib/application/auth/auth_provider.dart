import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_bag/application/auth/auth_state.dart';
import 'package:money_bag/domain/auth/i_auth_repo.dart';
import 'package:money_bag/domain/auth/login_body.dart';
import 'package:money_bag/domain/auth/signup_body.dart';
import 'package:money_bag/infrastucture/auth/auth._repo.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(FirebaseAuthRepo());
});

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepo authRepo;
  AuthNotifier(this.authRepo) : super(AuthState.init());

  login(LoginBody body) async {
    state = state.copyWith(loading: true);
    final responce = await authRepo.login(body).run();

    state = responce.fold((l) => state.copyWith(failure: l),
        (r) => state.copyWith(loading: false));
  }

  registration(RegistrationBody body) async {
    state = state.copyWith(loading: true);
    final responce = await authRepo.registration(body).run();

    state = responce.fold((l) => state.copyWith(failure: l),
        (r) => state.copyWith(loading: false));
  }

  checkAuth() async {
    state = state.copyWith(loading: true);
    final responce = await authRepo.checkAuth().run();

    state = responce.fold((l) => state.copyWith(failure: l),
        (r) => state.copyWith(loading: false));
  }
}
