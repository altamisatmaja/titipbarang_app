import 'package:titipbarang_app/utils/widget/my_scaffold.dart';

import 'profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfilePage extends GetView<ProfileController> {
  static const String route = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => MyScaffold(
        title: 'txt_profile'.tr,
        body: Container(),
      );
}
