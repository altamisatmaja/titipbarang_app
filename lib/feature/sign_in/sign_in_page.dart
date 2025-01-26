import 'sign_in_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInPage extends GetView<SignInController> {
  static const String route = '/sign/in';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => PopScope(
          canPop: !controller.isSigningIn.value,
          child: Scaffold(
            appBar: AppBar(
              title: Text('txt_sign_in'.tr),
            ),
            body: Form(
              key: controller.formKey,
              child: AutofillGroup(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: controller.textControllerUsername,
                      decoration: InputDecoration(labelText: 'txt_username'.tr),
                      textInputAction: TextInputAction.next,
                      readOnly: controller.isSigningIn.value,
                      autofillHints: const [AutofillHints.username],
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) return 'txt_empty_username'.tr;

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: controller.textControllerPassword,
                      decoration: InputDecoration(labelText: 'txt_password'.tr),
                      readOnly: controller.isSigningIn.value,
                      onEditingComplete: controller.isSigningIn.value ? null : controller.signIn,
                      autofillHints: const [AutofillHints.password],
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) return 'txt_empty_password'.tr;

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    FilledButton(
                      onPressed: controller.isSigningIn.value ? null : controller.signIn,
                      child: controller.isSigningIn.value
                          ? const SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: CircularProgressIndicator(),
                            )
                          : Text('txt_sign_in'.tr),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
