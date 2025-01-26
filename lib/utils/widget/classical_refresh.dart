import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassicalRefresh extends StatefulWidget {
  const ClassicalRefresh({
    super.key,
    required this.child,
    this.onRefresh,
    this.scrollDirection = Axis.vertical,
    this.onLoad,
    this.canLoadMore = false,
    this.indicatorPosition = IndicatorPosition.above,
  }) : childBuilder = null;

  const ClassicalRefresh.builder({
    super.key,
    required this.childBuilder,
    this.onRefresh,
    this.onLoad,
    this.scrollDirection = Axis.vertical,
    this.canLoadMore = false,
    this.indicatorPosition = IndicatorPosition.above,
  }) : child = null;

  final Widget? child;
  final FutureOr<IndicatorResult?> Function()? onRefresh;
  final FutureOr<IndicatorResult?> Function()? onLoad;
  final Axis scrollDirection;
  final bool canLoadMore;
  final Widget Function(BuildContext context, ScrollPhysics physics)? childBuilder;
  final IndicatorPosition indicatorPosition;

  @override
  State<ClassicalRefresh> createState() => _ClassicalRefreshState();
}

class _ClassicalRefreshState extends State<ClassicalRefresh> {
  late EasyRefreshController _controller;

  final _CIProperties _headerProperties = _CIProperties(
    name: 'Header',
    alignment: MainAxisAlignment.center,
    infinite: false,
  );
  final _CIProperties _footerProperties = _CIProperties(
    name: 'Footer',
    alignment: MainAxisAlignment.start,
    infinite: true,
    disable: true,
  );

  late List<_CIProperties> propertiesItems;

  @override
  void initState() {
    super.initState();
    propertiesItems = [_headerProperties, _footerProperties];
    _headerProperties.disable = widget.onRefresh == null;
    _footerProperties.disable = !widget.canLoadMore;
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  void didUpdateWidget(covariant ClassicalRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    _headerProperties.disable = widget.onRefresh == null;
    _footerProperties.disable = !widget.canLoadMore;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.childBuilder != null
      ? EasyRefresh.builder(
          clipBehavior: Clip.none,
          controller: _controller,
          triggerAxis: widget.scrollDirection,
          header: ClassicHeader(
            clamping: _headerProperties.clamping,
            position: widget.indicatorPosition,
            backgroundColor: _headerProperties.background ? context.theme.colorScheme.surfaceContainerHighest : null,
            mainAxisAlignment: _headerProperties.alignment,
            showMessage: _headerProperties.text,
            infiniteOffset: _headerProperties.infinite ? 70 : null,
            triggerWhenReach: _headerProperties.immediately,
            dragText: 'txt_pull_to_refresh'.tr,
            armedText: 'txt_realease_ready'.tr,
            readyText: 'txt_fetching_data',
            processingText: 'txt_fetching_data'.tr,
            processedText: 'txt_succeeded'.tr,
            noMoreText: 'txt_no_more'.tr,
            failedText: 'txt_failed'.tr,
            messageBuilder: (context, state, text, dateTime) => const SizedBox.shrink(),
          ),
          footer: ClassicFooter(
            clamping: _footerProperties.clamping,
            position: widget.indicatorPosition,
            backgroundColor: _footerProperties.background ? context.theme.colorScheme.surfaceContainerHighest : null,
            mainAxisAlignment: _footerProperties.alignment,
            showMessage: _footerProperties.text,
            infiniteOffset: _footerProperties.infinite ? 70 : null,
            triggerWhenReach: _footerProperties.immediately,
            dragText: 'txt_pull_to_refresh'.tr,
            armedText: 'txt_realease_ready'.tr,
            readyText: 'txt_fetching_data'.tr,
            processingText: 'txt_fetching_data'.tr,
            processedText: 'txt_succeeded'.tr,
            noMoreText: 'txt_no_more'.tr,
            failedText: 'txt_failed'.tr,
            messageText: 'txt_last_updated_at'.tr,
          ),
          onRefresh: _headerProperties.disable
              ? null
              : () async {
                  await widget.onRefresh?.call();
                  if (!mounted) return;
                  setState(() {});
                  _controller.finishRefresh();
                  _controller.resetFooter();
                },
          onLoad: _footerProperties.disable
              ? null
              : () async {
                  await widget.onLoad?.call();
                  if (!mounted) return;
                  setState(() {});
                  _controller.finishLoad(IndicatorResult.success);
                },
          childBuilder: widget.childBuilder,
        )
      : EasyRefresh(
          clipBehavior: Clip.none,
          controller: _controller,
          triggerAxis: widget.scrollDirection,
          header: ClassicHeader(
            clamping: _headerProperties.clamping,
            position: widget.indicatorPosition,
            backgroundColor: _headerProperties.background ? context.theme.colorScheme.surfaceContainerHighest : null,
            mainAxisAlignment: _headerProperties.alignment,
            showMessage: _headerProperties.text,
            infiniteOffset: _headerProperties.infinite ? 70 : null,
            triggerWhenReach: _headerProperties.immediately,
            dragText: 'txt_pull_to_refresh'.tr,
            armedText: 'txt_realease_ready'.tr,
            readyText: 'txt_refreshing'.tr,
            processingText: 'txt_refreshing'.tr,
            processedText: 'txt_succeeded'.tr,
            noMoreText: 'txt_no_more'.tr,
            failedText: 'txt_failed'.tr,
            messageText: 'txt_last_updated_at'.tr,
          ),
          footer: ClassicFooter(
            clamping: _footerProperties.clamping,
            position: widget.indicatorPosition,
            backgroundColor: _footerProperties.background ? context.theme.colorScheme.surfaceContainerHighest : null,
            mainAxisAlignment: _footerProperties.alignment,
            showMessage: _footerProperties.text,
            infiniteOffset: _footerProperties.infinite ? 70 : null,
            triggerWhenReach: _footerProperties.immediately,
            dragText: 'txt_pull_to_refresh'.tr,
            armedText: 'txt_realease_ready'.tr,
            readyText: 'txt_fetching_data',
            processingText: 'txt_fetching_data'.tr,
            processedText: 'txt_succeeded'.tr,
            noMoreText: 'txt_no_more'.tr,
            failedText: 'txt_failed'.tr,
            messageBuilder: (context, state, text, dateTime) => const SizedBox.shrink(),
          ),
          onRefresh: _headerProperties.disable
              ? null
              : () async {
                  IndicatorResult? result = await widget.onRefresh?.call();
                  if (!mounted) return;
                  setState(() {});
                  _controller.finishRefresh(result ?? IndicatorResult.success);
                  _controller.resetFooter();
                },
          onLoad: _footerProperties.disable
              ? null
              : () async {
                  IndicatorResult? result = await widget.onLoad?.call();
                  if (!mounted) return;
                  setState(() {});
                  _controller.finishLoad(result ?? IndicatorResult.success);
                },
          child: widget.child,
        );
}

/// Classic indicator properties.
class _CIProperties {
  final String name;
  bool disable;
  bool clamping = false;
  bool background = false;
  MainAxisAlignment alignment;
  bool message = true;
  bool text = true;
  bool infinite;
  bool immediately = false;

  _CIProperties({
    required this.name,
    required this.alignment,
    required this.infinite,
    this.disable = false,
  });
}
