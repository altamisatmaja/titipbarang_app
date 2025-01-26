import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/data/remote/api_service.dart';
import 'package:titipbarang_app/data/remote/wrapper/api_response.dart';
import 'package:titipbarang_app/feature/auth/auth_controller.dart';
import 'package:titipbarang_app/utils/helper/error_helper.dart';

class SignInController extends GetxController {
  String tag = 'SignIn::->';

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController textControllerUsername = TextEditingController(text: !kReleaseMode ? 'emilys' : '');
  final TextEditingController textControllerPassword = TextEditingController(text: !kReleaseMode ? 'emilyspass' : '');

  final RxBool isSigningIn = false.obs;

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    isSigningIn.value = true;

    try {
      ApiClient? apiClient = await createApiClient();

      if (apiClient == null) {
        isSigningIn.value = false;
        return;
      }

      ResponseSignIn response = await apiClient.login(
        username: textControllerUsername.text.trim(),
        password: textControllerPassword.text.trim(),
      );

      await AuthController.find.saveAuthData(user: response.user, token: response.accessToken);
    } catch (e) {
      ErrorHelper.handleError(e);
    }

    isSigningIn.value = false;
  }
}
