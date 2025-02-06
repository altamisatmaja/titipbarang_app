import 'activity_binding.dart';
import 'activity_page.dart';
import 'package:get/get.dart';

final activityRoute = [
  GetPage(
    name: ActivityPage.route,
    page: () => const ActivityPage(),
    binding: ActivityBinding(),
  ),
];