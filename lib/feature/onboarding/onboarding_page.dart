import 'package:flutter/gestures.dart';
import 'package:titipbarang_app/resources/resources.dart';

import 'onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends GetView<OnboardingController> {
  static const String route = '/onboarding';

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 135.0,
                              child:
                                  AppAssets.icon.titipbarangIconTextColor.image(
                                width: 135.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            OutlinedButton(
                              style: const ButtonStyle(
                                  padding:
                                      WidgetStatePropertyAll(EdgeInsets.zero),
                                  minimumSize:
                                      WidgetStatePropertyAll(Size(75, 30)),
                                  maximumSize: WidgetStatePropertyAll(
                                    Size(double.infinity, 30),
                                  ),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.black12),
                                  side: WidgetStatePropertyAll(
                                      BorderSide(color: Colors.black12))),
                              onPressed: () {},
                              child: Text('txt_skip'.tr),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      SizedBox(
                        width: double.infinity,
                        height: 375.0,
                        child: AppAssets.images.onboardingImg.image(
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Selamat datang di Titip Barang!',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      'Silahkan masuk terlebih dahulu melalui akun Google Anda!',
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 25.0),
                    FilledButton.icon(
                      onPressed: () {},
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppAssets.icon.googleIconWhite.image(),
                          const SizedBox(width: 10.0),
                          Text(
                            'Lanjutkan dengan google',
                            style: context.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black),
                        children: [
                          const TextSpan(text: 'Saya menyetujui '),
                          TextSpan(
                            text: 'Ketentuan Layanan',
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint('Ketentuan Layanan diklik');
                              },
                          ),
                          const TextSpan(text: ' & '),
                          TextSpan(
                            text: 'Kebijakan Privasi',
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint('Ketentuan Layanan diklik');
                              },
                          ),
                          const TextSpan(text: ' titipbarang.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
