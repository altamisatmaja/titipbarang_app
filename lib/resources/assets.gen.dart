/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/resources
  $LibResourcesGen get resources => const $LibResourcesGen();
}

class $LibResourcesGen {
  const $LibResourcesGen();

  /// Directory path: lib/resources/icons
  $LibResourcesIconsGen get icons => const $LibResourcesIconsGen();

  /// Directory path: lib/resources/images
  $LibResourcesImagesGen get images => const $LibResourcesImagesGen();
}

class $LibResourcesIconsGen {
  const $LibResourcesIconsGen();

  /// File path: lib/resources/icons/activity-active-icon.png
  AssetGenImage get activityActiveIcon =>
      const AssetGenImage('lib/resources/icons/activity-active-icon.png');

  /// File path: lib/resources/icons/activity-unactive-icon.png
  AssetGenImage get activityUnactiveIcon =>
      const AssetGenImage('lib/resources/icons/activity-unactive-icon.png');

  /// File path: lib/resources/icons/google-icon-white.png
  AssetGenImage get googleIconWhite =>
      const AssetGenImage('lib/resources/icons/google-icon-white.png');

  /// File path: lib/resources/icons/home-active-icon.png
  AssetGenImage get homeActiveIcon =>
      const AssetGenImage('lib/resources/icons/home-active-icon.png');

  /// File path: lib/resources/icons/home_antarjemput_icon.png
  AssetGenImage get homeAntarjemputIcon =>
      const AssetGenImage('lib/resources/icons/home_antarjemput_icon.png');

  /// File path: lib/resources/icons/home_packingbarang_icon.png
  AssetGenImage get homePackingbarangIcon =>
      const AssetGenImage('lib/resources/icons/home_packingbarang_icon.png');

  /// File path: lib/resources/icons/home_selfstorage_icon.png
  AssetGenImage get homeSelfstorageIcon =>
      const AssetGenImage('lib/resources/icons/home_selfstorage_icon.png');

  /// File path: lib/resources/icons/home_tenagaangkut_icon.png
  AssetGenImage get homeTenagaangkutIcon =>
      const AssetGenImage('lib/resources/icons/home_tenagaangkut_icon.png');

  /// File path: lib/resources/icons/home_titipbarang_icon.png
  AssetGenImage get homeTitipbarangIcon =>
      const AssetGenImage('lib/resources/icons/home_titipbarang_icon.png');

  /// File path: lib/resources/icons/home_transit_icon.png
  AssetGenImage get homeTransitIcon =>
      const AssetGenImage('lib/resources/icons/home_transit_icon.png');

  /// File path: lib/resources/icons/information-active-icon.png
  AssetGenImage get informationActiveIcon =>
      const AssetGenImage('lib/resources/icons/information-active-icon.png');

  /// File path: lib/resources/icons/information-unactive-icon.png
  AssetGenImage get informationUnactiveIcon =>
      const AssetGenImage('lib/resources/icons/information-unactive-icon.png');

  /// File path: lib/resources/icons/profile-active-icon.png
  AssetGenImage get profileActiveIcon =>
      const AssetGenImage('lib/resources/icons/profile-active-icon.png');

  /// File path: lib/resources/icons/profile-unactive-icon.png
  AssetGenImage get profileUnactiveIcon =>
      const AssetGenImage('lib/resources/icons/profile-unactive-icon.png');

  /// File path: lib/resources/icons/titipbarang_icon_launcher.png
  AssetGenImage get titipbarangIconLauncher =>
      const AssetGenImage('lib/resources/icons/titipbarang_icon_launcher.png');

  /// File path: lib/resources/icons/titipbarang_icon_text_color.png
  AssetGenImage get titipbarangIconTextColor => const AssetGenImage(
      'lib/resources/icons/titipbarang_icon_text_color.png');

  /// File path: lib/resources/icons/titipbarang_splash_icon.png
  AssetGenImage get titipbarangSplashIcon =>
      const AssetGenImage('lib/resources/icons/titipbarang_splash_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        activityActiveIcon,
        activityUnactiveIcon,
        googleIconWhite,
        homeActiveIcon,
        homeAntarjemputIcon,
        homePackingbarangIcon,
        homeSelfstorageIcon,
        homeTenagaangkutIcon,
        homeTitipbarangIcon,
        homeTransitIcon,
        informationActiveIcon,
        informationUnactiveIcon,
        profileActiveIcon,
        profileUnactiveIcon,
        titipbarangIconLauncher,
        titipbarangIconTextColor,
        titipbarangSplashIcon
      ];
}

class $LibResourcesImagesGen {
  const $LibResourcesImagesGen();

  /// File path: lib/resources/images/dummy_ads_image.png
  AssetGenImage get dummyAdsImage =>
      const AssetGenImage('lib/resources/images/dummy_ads_image.png');

  /// File path: lib/resources/images/onboarding-img.png
  AssetGenImage get onboardingImg =>
      const AssetGenImage('lib/resources/images/onboarding-img.png');

  /// List of all assets
  List<AssetGenImage> get values => [dummyAdsImage, onboardingImg];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
