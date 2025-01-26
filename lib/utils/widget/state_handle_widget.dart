import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:titipbarang_app/utils/helper/controller/state_controller.dart';

class StateHandleWidget<T> extends StatelessWidget {
  const StateHandleWidget({
    super.key,
    required this.controller,
    required this.onSuccess,
    this.onEmptyChild,
    this.onEmptyPressed,
    this.onErrorChild,
    this.onErrorPressed,
    this.onLoadingChild,
    this.builder,
  });

  final StateController<T> controller;
  final NotifierBuilder<T?> onSuccess;
  final Widget? onEmptyChild;
  final VoidCallback? onEmptyPressed;
  final Widget Function(String? error)? onErrorChild;
  final VoidCallback? onErrorPressed;
  final Widget? onLoadingChild;
  final Widget? Function(RxStatus status, Widget child)? builder;

  @override
  Widget build(BuildContext context) => SimpleBuilder(
        builder: (context) {
          Widget child;

          if (controller.status.isLoading) {
            child = onLoadingChild ?? const Center(child: CircularProgressIndicator());
          } else if (controller.status.isError) {
            child = Center(
              child: onErrorChild?.call(controller.status.errorMessage) ??
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        kReleaseMode ? 'txt_an_error_occured'.tr : controller.status.errorMessage ?? '-',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      if (onEmptyPressed != null) ...[
                        const SizedBox(height: 16.0),
                        FilledButton(
                          onPressed: onErrorPressed,
                          child: Text('txt_retry'.tr),
                        ),
                      ],
                    ],
                  ),
            );
          } else if (controller.status.isEmpty) {
            child = Center(
              child: onEmptyChild ??
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'txt_no_data'.tr,
                        textAlign: TextAlign.center,
                      ),
                      if (onEmptyPressed != null) ...[
                        const SizedBox(height: 16.0),
                        FilledButton(
                          onPressed: onEmptyPressed,
                          child: Text('txt_retry'.tr),
                        ),
                      ],
                    ],
                  ),
            );
          } else {
            // ignore: invalid_use_of_protected_member
            child = onSuccess(controller.value);
          }

          return builder?.call(controller.status, child) ?? child;
        },
      );
}
