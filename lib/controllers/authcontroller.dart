import 'package:get/get.dart';
import '../ services/authservice.dart';
import '../models/usermodel.dart';

class AuthController extends GetxController {
  final user = Rxn<UserModel>();
  final AuthService _authService = AuthService();

  Future<bool> signIn() async {
    final result = await _authService.signInWithGoogle();
    if (result != null) {
      user.value = result;
      return true;
    }
    return false;
  }

  Future<void> signOut() async {
    await _authService.signOut();
    user.value = null;
  }

  Future<void> loadUser(String userId) async {
    final result = await _authService.fetchUser(userId);
    if (result != null) {
      user.value = result;
    }
  }
}
