import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/data/remote/app_info.dart';
import 'package:url_launcher/url_launcher.dart';

class VersionWidget extends StatelessWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
        style: context.textTheme.bodySmall!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://google.com')),
              child: const Text('google.com'),
            ),
            const Text(' • '),
            Text(AppInfo.formattedVersion),
          ],
        ),
      );
}
