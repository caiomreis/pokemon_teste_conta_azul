import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/style/poke_teste_icons.dart';
import 'package:poke_teste/app/widgets/text/body/body.dart';
import 'package:poke_teste/app/style/app_colors.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final bool isCaptured;
  final bool isFavorite;
  final Function onFavoriteAction;
  final Function onCapturedAction;
  const PokemonCard({
    super.key,
    required this.name,
    required this.isCaptured,
    required this.isFavorite,
    required this.onFavoriteAction,
    required this.onCapturedAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.navigate('/pokemon_details/$name');
      },
      child: Container(
        height: 43,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0Xfff6f6f6),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow()],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(right: 13.0),
                child: Body.bold(
                  text: name,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            SizedBox(
              width: 16,
              height: 16,
              child: Poke_testeIcon(
                onTap: () {
                  onFavoriteAction();
                },
                color: isFavorite
                    ? Poke_Teste_Colors.theme.red.medium
                    : Poke_Teste_Colors.theme.gray.strong,
                icon: isFavorite
                    ? Poke_testeIconsEnum.heart_filled
                    : Poke_testeIconsEnum.heart,
                width: 18,
                height: 18,
              ),
            ),
            SizedBox(
              width: 16,
              height: 16,
              child: Poke_testeIcon(
                onTap: () {
                  onCapturedAction();
                },
                color: isCaptured
                    ? Poke_Teste_Colors.theme.red.medium
                    : Poke_Teste_Colors.theme.gray.strong,
                icon: Poke_testeIconsEnum.pokebola,
                width: 18,
                height: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
