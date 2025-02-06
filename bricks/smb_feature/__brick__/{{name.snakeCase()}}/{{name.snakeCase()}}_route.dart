import '{{name.snakeCase()}}_binding.dart';
import '{{name.snakeCase()}}_page.dart';
import 'package:get/get.dart';

final {{name.camelCase()}}Route = [
  GetPage(
    name: {{name.pascalCase()}}Page.route,
    page: () => const {{name.pascalCase()}}Page(),
    binding: {{name.pascalCase()}}Binding(),
  ),
];