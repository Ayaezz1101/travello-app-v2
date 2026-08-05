import 'package:supabase_flutter/supabase_flutter.dart' ;


class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

Future<bool> verifyOTP(String email, String token, {OtpType type = OtpType.signup}) async {
  try {
    final AuthResponse res = await _supabase.auth.verifyOTP(
      type: type,
      token: token,
      email: email,
    );
    return res.session != null;
  } catch (e) {
    print("خطأ في التحقق: $e");
    return false;
  }
}


Future<void> sendOTP(String email, {OtpType type = OtpType.signup}) async {
  try {
    await _supabase.auth.resend(
      type: type, 
      email: email,
    );
  } catch (e) {
    print("Error resending OTP: $e");
    throw Exception("Error sending OTP: $e");
  }
}
Future<void> resetPasswordRequest(String email) async {
  try {
    await _supabase.auth.resetPasswordForEmail(email);
  } catch (e) {
    print("Error in resetPasswordRequest: $e");
    throw Exception(e);
  }
}
Future<bool> updatePassword(String newPassword) async {
  try {
    final UserResponse res = await _supabase.auth.updateUser(
      UserAttributes(password: newPassword),
    );
    return res.user != null;
  } catch (e) {
    print("خطأ في تحديث كلمة المرور: $e");
    return false;
  }
}


  Future<User?> signUp(String email, String password) async {
    try {
      final AuthResponse result = await _supabase.auth.signUp(
          email: email, password: password);
      return result.user ;
    } catch (e) {
      print("Sign Up Error: ${e.toString()}");
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final AuthResponse result = await _supabase.auth.signInWithPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print("Sign In Error: ${e.toString()}");
      return null;
    }
  }

  
  Future<void> signOut() async => await _supabase.auth.signOut();
  
}
