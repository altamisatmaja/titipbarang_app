import 'package:titipbarang_app/utils/widget/my_scaffold.dart';

import 'information_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InformationPage extends GetView<InformationController> {
  static const String route = '/information';

  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) => MyScaffold(
        title: 'txt_information'.tr,
        body: Container(),
      );
}
