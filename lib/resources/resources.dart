import 'package:flutter/material.dart';
import 'package:titipbarang_app/resources/assets.gen.dart';

abstract class AppAssets {
  static $LibResourcesImagesGen images = Assets.lib.resources.images;
  static $LibResourcesIconsGen icon = Assets.lib.resources.icons;
  // static $LibResourcesImagesNobuIconPackGen get nobuIconPack => Assets.lib.resources.images.nobuIconPack;
  // static $LibResourcesImagesSmbIconPackGen get smbIconPack => Assets.lib.resources.images.smbIconPack;
  // static $LibResourcesImagesLogoGen get logo => Assets.lib.resources.images.logo;
  // static $LibResourcesImagesIconsGen get icons => Assets.lib.resources.images.icons;
  // static $LibResourcesRivesGen get rives => Assets.lib.resources.rives;
}

abstract class AppColors {
  static const primary = Color(0xFFEEBE41);
  static const grey = Color(0xFF828282);
  // static const divider = Color(0xff8897AD);
  // static const avatarBorder = Color(0xffE8DDD1);
  // static const cardBackgroundDark = Color(0xff191919);
  // static const nobuItem = Color(0xffFDEABA);
  static const white = Colors.white;
  // static const black = Colors.black;
  static const homeTitipBarangBorder = Color(0xFF9EE4B8);
  static const homeTitipBarangBg = Color(0xFFD3F8DF);

  static const homeTransitBorder = Color(0xFFF0AAC7);
  static const homeTransitBg = Color(0xFFFFE2E9);

  static const homeTenagaAngkutBorder = Color(0xFFAACDF0);
  static const homeTenagaAngkutBg = Color(0xFFE8F0FF);

  static const homeAntarJemputBorder = Color(0xFFA1DFB8);
  static const homeAntarJemputBg = Color(0xFFA1DFB8);

  static const homePackingBarangBorder = Color(0xFFAAF0C4);
  static const homePackingBarangBg = Color(0xFFE1FFE4);

  static const homeSelfStorageBorder = Color(0xFFAAF0C4);
  static const homeSelfStorageBg = Color(0xFFE1FFE4);

  // static final shimmerBaseColor = Colors.grey[300]!;
  // static final shimmerHighlightColor = Colors.grey[100]!;
}
