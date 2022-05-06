import 'package:flutter/material.dart';

class ImageOrPlaceholder extends StatelessWidget {
  const ImageOrPlaceholder(
    this.url, {
    Key? key,
    this.height = 120,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => Image.asset(
        'assets/image/placeholder.png',
        height: height,
        fit: fit,
      ),
    );
  }
}
