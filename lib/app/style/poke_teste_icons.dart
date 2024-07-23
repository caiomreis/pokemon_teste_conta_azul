// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Para adicionar novos ícones, faça:
///
/// 1 - Adicione o SVG na pasta de [assets/icons], com o nome do
/// arquivo no padrão snake_case e a imagem sem bordas;
///
/// 2 - Adicione o item no enum [Poke_testeIconsEnum] com o nome do arquivo
/// no padrão camelCase;
///
/// 3 - Adicione aos switchs da extensão [Poke_testeIconsEnumExtension] como
/// resolver cada tamanho de ícone.
enum Poke_testeIconsEnum {
  logo,
  user,
  close_bold,
  refresh,
  pokedex,
  view,
  pokebola,
  profile,
  heart,
  pin,
  heart_filled,
  pokebola_filled,
  back
}

extension Poke_testeIconsEnumExtension on Poke_testeIconsEnum {
  /// Retorna o [assetName] transformando o nome do enum
  /// em uma string, alterando de camelCase para snake_case
  String get assetName {
    RegExp upperCaseLetters = RegExp('(?<=[a-z])[A-Z]');
    return 'assets/icons/${name.replaceAllMapped(upperCaseLetters, (m) {
      final String match = m.group(0) ?? '';
      return '_$match';
    }).toLowerCase()}.svg';
  }
}

class Poke_testeIcon extends StatelessWidget {
  final Poke_testeIconsEnum icon;
  final double width;
  final double height;
  final double? areaWidth;
  final double? areaHeight;
  final VoidCallback? onTap;
  final Color? color;

  const Poke_testeIcon({
    Key? key,
    required this.icon,
    required this.width,
    required this.height,
    this.areaWidth,
    this.areaHeight,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: areaHeight ?? height,
        width: areaWidth ?? width,
        child: Center(
          child: SvgPicture.asset(
            icon.assetName,
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
    );
  }
}
