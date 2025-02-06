import '{{name.snakeCase()}}_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class {{name.pascalCase()}}Page extends GetView<{{name.pascalCase()}}Controller> {
  static const String route = '/{{name.pathCase()}}';

  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold();
}