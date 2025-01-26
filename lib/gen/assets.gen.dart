/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_previous.svg
  String get arrowPrevious => 'assets/icons/arrow_previous.svg';

  /// List of all assets
  List<String> get values => [arrowPrevious];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appLogo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/images/appLogo.png');

  /// File path: assets/images/error_image.png
  AssetGenImage get errorImage =>
      const AssetGenImage('assets/images/error_image.png');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/searchs_new.png
  AssetGenImage get searchsNew =>
      const AssetGenImage('assets/images/searchs_new.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo, errorImage, icon, searchsNew];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/Wede_Animation.json
  String get wedeAnimation => 'assets/lottie/Wede_Animation.json';

  /// File path: assets/lottie/add_to_cart.json
  String get addToCart => 'assets/lottie/add_to_cart.json';

  /// File path: assets/lottie/bird_ring.lottie
  String get birdRing => 'assets/lottie/bird_ring.lottie';

  /// File path: assets/lottie/cart_is_empty.json
  String get cartIsEmpty => 'assets/lottie/cart_is_empty.json';

  /// File path: assets/lottie/empty_screen.json
  String get emptyScreen => 'assets/lottie/empty_screen.json';

  /// File path: assets/lottie/favourite.json
  String get favourite => 'assets/lottie/favourite.json';

  /// File path: assets/lottie/hamburger.json
  String get hamburger => 'assets/lottie/hamburger.json';

  /// File path: assets/lottie/image_shimmer.json
  String get imageShimmer => 'assets/lottie/image_shimmer.json';

  /// File path: assets/lottie/item_not_found.json
  String get itemNotFound => 'assets/lottie/item_not_found.json';

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/loading_icecream.json
  String get loadingIcecream => 'assets/lottie/loading_icecream.json';

  /// File path: assets/lottie/loading_spinner.json
  String get loadingSpinner => 'assets/lottie/loading_spinner.json';

  /// File path: assets/lottie/loading_spinner_alt.json
  String get loadingSpinnerAlt => 'assets/lottie/loading_spinner_alt.json';

  /// File path: assets/lottie/lottie_food_loading.json
  String get lottieFoodLoading => 'assets/lottie/lottie_food_loading.json';

  /// File path: assets/lottie/lottie_list_loading.json
  String get lottieListLoading => 'assets/lottie/lottie_list_loading.json';

  /// File path: assets/lottie/lottie_round_food_loading.json
  String get lottieRoundFoodLoading =>
      'assets/lottie/lottie_round_food_loading.json';

  /// File path: assets/lottie/not_found.json
  String get notFound => 'assets/lottie/not_found.json';

  /// File path: assets/lottie/rating.json
  String get rating => 'assets/lottie/rating.json';

  /// File path: assets/lottie/remove_from_cart.json
  String get removeFromCart => 'assets/lottie/remove_from_cart.json';

  /// File path: assets/lottie/restaurant_loading.json
  String get restaurantLoading => 'assets/lottie/restaurant_loading.json';

  /// File path: assets/lottie/success.json
  String get success => 'assets/lottie/success.json';

  /// File path: assets/lottie/success1.json
  String get success1 => 'assets/lottie/success1.json';

  /// File path: assets/lottie/waiting.json
  String get waiting => 'assets/lottie/waiting.json';

  /// List of all assets
  List<String> get values => [
        wedeAnimation,
        addToCart,
        birdRing,
        cartIsEmpty,
        emptyScreen,
        favourite,
        hamburger,
        imageShimmer,
        itemNotFound,
        loading,
        loadingIcecream,
        loadingSpinner,
        loadingSpinnerAlt,
        lottieFoodLoading,
        lottieListLoading,
        lottieRoundFoodLoading,
        notFound,
        rating,
        removeFromCart,
        restaurantLoading,
        success,
        success1,
        waiting
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
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
