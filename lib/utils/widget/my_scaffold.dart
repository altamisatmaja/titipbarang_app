import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const MyScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          title,
          style: context.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black12,
            height: 1.0,
          ),
        ),
      ),
      body: body,
    );
  }
}
