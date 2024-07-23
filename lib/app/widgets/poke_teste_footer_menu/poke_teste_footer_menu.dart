// ignore_for_file: camel_case_types

import 'package:poke_teste/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:poke_teste/app/style/poke_teste_icons.dart';
import 'package:poke_teste/app/widgets/poke_teste_footer_menu/poke_teste_footer_button.dart';

class Poke_testeFooterMenu extends StatelessWidget {
  final VoidCallback onPokedexAction;
  final VoidCallback onCapituredACtion;
  final VoidCallback onFavoriteAction;
  final VoidCallback onProfileAction;
  final bool isPokedexActive;
  final bool isCapituredActive;
  final bool isFavoriteActive;
  final bool isProfileActive;
  const Poke_testeFooterMenu({
    super.key,
    required this.onPokedexAction,
    required this.onCapituredACtion,
    required this.onFavoriteAction,
    required this.onProfileAction,
    required this.isPokedexActive,
    required this.isCapituredActive,
    required this.isFavoriteActive,
    required this.isProfileActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Poke_testeColors.theme.neutral.white,
      height: 93,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Poke_testeFooterButton(
            icon: Poke_testeIconsEnum.pokebola,
            isActive: isPokedexActive,
            label: 'Pokedéx',
            onAction: onPokedexAction,
          ),
          Poke_testeFooterButton(
            icon: Poke_testeIconsEnum.pin,
            isActive: isCapituredActive,
            label: 'Pegos',
            onAction: onCapituredACtion,
          ),
          Poke_testeFooterButton(
            icon: Poke_testeIconsEnum.heart,
            isActive: isFavoriteActive,
            label: 'Favoritos',
            onAction: onFavoriteAction,
          ),
          Poke_testeFooterButton(
            icon: Poke_testeIconsEnum.profile,
            isActive: isProfileActive,
            label: 'Perfil',
            onAction: onProfileAction,
          ),
        ],
      ),
    );
  }
}
