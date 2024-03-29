import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_constants.dart';

class PhotoView extends StatelessWidget {
  final String icon;

  const PhotoView({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${Constants.baseUrl}img/w/$icon.png",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
        width: 70,
        height: 70,
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
