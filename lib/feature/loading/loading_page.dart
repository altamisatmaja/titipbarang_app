import 'loading_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoadingPage extends GetView<LoadingController> {
  static const String route = '/loading';

  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
