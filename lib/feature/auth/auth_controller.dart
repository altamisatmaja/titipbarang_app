import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/data/local/secure/secure_storage_manager.dart';
import 'package:titipbarang_app/data/remote/api_service.dart';
import 'package:titipbarang_app/data/remote/wrapper/api_response.dart';
import 'package:titipbarang_app/feature/auth/auth_state.dart';
import 'package:titipbarang_app/feature/loading/loading_page.dart';
import 'package:titipbarang_app/feature/sign_in/sign_in_page.dart';
import 'package:titipbarang_app/feature/main/main_page.dart';
import 'package:titipbarang_app/model/user/user.dart';

class AuthController extends GetxController {
  String tag = 'AuthController::->';

  static AuthController get find => Get.find();

  Rxn<AuthState> authState = Rxn();

  bool get isAuthenticated => authState.value == AuthState.authenticated;

  bool get isUnauthenticated => !isAuthenticated;

  final SecureStorageManager secureStorage = SecureStorageManager();
  Rxn<User> currentUser = Rxn();

  @override
  void onReady() {
    ever(authState, authChanged);
    authState.value = null;
    authState.value = AuthState.initial;
    super.onReady();
  }

  Future<void> authChanged(AuthState? state) async {
    log('$tag state : $state');
    switch (state) {
      case AuthState.initial:
        await signInWithToken();
      case AuthState.unauthenticated:
        await clearData();
      case AuthState.authenticated:
        Get.offAllNamed(MainPage.route);
      default:
        Get.toNamed(LoadingPage.route);
    }
  }

  Future<void> signInWithToken({bool setAuthenticated = true}) async {
    String? token = await secureStorage.getToken();

    ApiClient? apiClient = await createApiClient();

    if (apiClient == null) return;

    try {
      ResponseSignIn response = await apiClient.getMe();

      await saveAuthData(user: response.user, token: token, setAuthenticated: setAuthenticated);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        signOut();
      }
    }
  }

  Future<void> clearData() async {
    Get.offAllNamed(SignInPage.route);

    currentUser.value = null;

    await secureStorage.deleteToken();

    // try {
    //   ApiClient? apiClient = await createApiClient();

    //   if (apiClient == null) return;

    //   await apiClient.signOut();
    // } catch (e) {
    //   // Ignored, really
    // }
  }

  Future<void> saveAuthData({required User? user, required String? token, bool setAuthenticated = true}) async {
    if (token != null) await secureStorage.setToken(token);

    currentUser.value = user;

    if (setAuthenticated) setAuth();
  }

  void signOut() => authState.value = AuthState.unauthenticated;

  void setAuth() => authState.value = AuthState.authenticated;
}
