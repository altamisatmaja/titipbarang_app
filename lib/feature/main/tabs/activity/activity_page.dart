import 'package:titipbarang_app/resources/resources.dart';
import 'package:titipbarang_app/utils/widget/my_scaffold.dart';

import 'activity_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ActivityPage extends GetView<ActivityController> {
  static const String route = '/activity';

  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) => MyScaffold(
        title: 'txt_activity'.tr,
        body: Container(),
      );
}
