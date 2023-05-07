import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    this.imageUrl,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.progressIndicatorColor,
    this.progressIndicatorStrokeWidth,
    this.borderWidth,
    this.borderColor,
  });

  final String? imageUrl;
  final double? radius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? progressIndicatorColor;
  final double? progressIndicatorStrokeWidth;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? 200,
      width: width ?? 200,
      imageUrl: imageUrl ?? _getDefaultImage,
      imageBuilder: (context, imageProvider) => Container(
        padding: EdgeInsets.all(borderWidth ?? 0),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Theme.of(context).colorScheme.secondary,
            width: borderWidth ?? 0,
            style: borderWidth != null ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (_, __) => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            progressIndicatorColor ?? Theme.of(context).colorScheme.secondary,
          ),
          strokeWidth: progressIndicatorStrokeWidth ?? 2,
        ),
      ),
      errorWidget: (_, __, ___) => Container(
        height: height ?? 200,
        width: width ?? 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          color: const Color(0xFFBFBFBF),
          border: Border.all(
            color: borderColor ?? Theme.of(context).colorScheme.secondary,
            width: borderWidth ?? 0,
            style: borderWidth != null ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.image,
            color: Colors.white,
            size: _getSizeIcon(),
          ),
        ),
      ),
    );
  }

  double _getSizeIcon() {
    if (width != null && height != null) {
      return width! > height! ? height! / 2 : width! / 2;
    } else if (width != null) {
      return width! / 2;
    } else if (height != null) {
      return height! / 2;
    } else {
      return 24;
    }
  }

  String get _getDefaultImage =>
      'https://user-images.githubusercontent.com/67009935/146430403-2f72c985-1f0d-458d-9894-17efbb762a58.png';
}
