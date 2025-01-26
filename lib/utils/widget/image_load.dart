import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoad extends StatelessWidget {
  const ImageLoad({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.child,
    this.fit,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final Widget? child;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        width: width,
        height: height,
        placeholder: (context, url) => child ?? const SizedBox.shrink(),
        errorWidget: (context, url, error) => child ?? const SizedBox.shrink(),
        fit: fit,
      );
}
