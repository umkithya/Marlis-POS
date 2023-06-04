/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add order.svg
  String get addOrder => 'assets/images/add order.svg';

  /// File path: assets/images/cart.svg
  String get cart => 'assets/images/cart.svg';

  /// File path: assets/images/ganzberg.svg
  String get ganzberg => 'assets/images/ganzberg.svg';

  /// File path: assets/images/home.svg
  String get home => 'assets/images/home.svg';

  /// File path: assets/images/malis-pos-logo.png
  AssetGenImage get malisPosLogo =>
      const AssetGenImage('assets/images/malis-pos-logo.png');

  /// File path: assets/images/menu.svg
  String get menu => 'assets/images/menu.svg';

  /// File path: assets/images/nike_animation.mp4
  String get nikeAnimation => 'assets/images/nike_animation.mp4';

  /// File path: assets/images/notificaiton.svg
  String get notificaiton => 'assets/images/notificaiton.svg';

  /// File path: assets/images/product.svg
  String get product => 'assets/images/product.svg';

  /// File path: assets/images/report.svg
  String get report => 'assets/images/report.svg';

  $AssetsImagesSalePngGen get salePng => const $AssetsImagesSalePngGen();
  $AssetsImagesSaleSvgGen get saleSvg => const $AssetsImagesSaleSvgGen();

  /// List of all assets
  List<dynamic> get values => [
        addOrder,
        cart,
        ganzberg,
        home,
        malisPosLogo,
        menu,
        nikeAnimation,
        notificaiton,
        product,
        report
      ];
}

class $AssetsImagesSalePngGen {
  const $AssetsImagesSalePngGen();

  /// File path: assets/images/sale_png/coca.png
  AssetGenImage get coca =>
      const AssetGenImage('assets/images/sale_png/coca.png');

  /// File path: assets/images/sale_png/hotdog.png
  AssetGenImage get hotdog =>
      const AssetGenImage('assets/images/sale_png/hotdog.png');

  /// File path: assets/images/sale_png/melon.png
  AssetGenImage get melon =>
      const AssetGenImage('assets/images/sale_png/melon.png');

  /// List of all assets
  List<AssetGenImage> get values => [coca, hotdog, melon];
}

class $AssetsImagesSaleSvgGen {
  const $AssetsImagesSaleSvgGen();

  /// File path: assets/images/sale_svg/downicon.svg
  String get downicon => 'assets/images/sale_svg/downicon.svg';

  /// File path: assets/images/sale_svg/filter.svg
  String get filter => 'assets/images/sale_svg/filter.svg';

  /// File path: assets/images/sale_svg/scan.svg
  String get scan => 'assets/images/sale_svg/scan.svg';

  /// File path: assets/images/sale_svg/search.svg
  String get search => 'assets/images/sale_svg/search.svg';

  /// File path: assets/images/sale_svg/uparrow.svg
  String get uparrow => 'assets/images/sale_svg/uparrow.svg';

  /// File path: assets/images/sale_svg/upicon.svg
  String get upicon => 'assets/images/sale_svg/upicon.svg';

  /// List of all assets
  List<String> get values => [downicon, filter, scan, search, uparrow, upicon];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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
