// ignore_for_file: camel_case_types

import 'package:poke_teste/app/widgets/text/label/label.dart';
import 'package:poke_teste/app/style/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Poke_testeCachedImage extends StatelessWidget {
  final String? imageUrl;
  final double heigth;
  final double width;
  final String? label;

  const Poke_testeCachedImage({
    this.imageUrl,
    required this.heigth,
    required this.width,
    this.label,
  });
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(width),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width),
        child: _getImage(),
      ),
    );
  }

  Widget _getImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: heigth,
          width: width,
          decoration: BoxDecoration(
            color: Poke_testeColors.theme.neutral.white,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      placeholder: (context, url) => _getDefaultImage(),
      errorWidget: (context, url, error) => _getDefaultImage(),
    );
  }

  _getDefaultImage() {
    String resume = label != null ? label![0].toUpperCase() : 'Q';

    return Container(
      height: heigth,
      width: width,
      color: Poke_testeColors.theme.red.medium,
      child: Center(
        child: Label.bold(
          text: resume,
          color: Poke_testeColors.theme.neutral.white,
        ),
      ),
    );
  }
}
