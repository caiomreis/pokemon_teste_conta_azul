import 'package:poke_teste/app/widgets/text/label/label.dart';
import 'package:poke_teste/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:poke_teste/app/style/poke_teste_icons.dart';

class Poke_testeFooterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final Poke_testeIconsEnum icon;
  final VoidCallback onAction;

  const Poke_testeFooterButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.icon,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onAction,
      child: AnimatedContainer(
        width: isActive ? 78 : 65,
        height: isActive ? 68 : 61,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isActive
                  ? Poke_testeColors.theme.red.medium
                  : Poke_testeColors.theme.neutral.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        duration: const Duration(milliseconds: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: Poke_testeIcon(
                color: isActive
                    ? Poke_testeColors.theme.red.medium
                    : Poke_testeColors.theme.gray.strong,
                icon: icon,
                width: 18,
                height: 18,
              ),
            ),
            Label.bold(
              text: label,
              color: isActive
                  ? Poke_testeColors.theme.red.medium
                  : Poke_testeColors.theme.gray.base,
            )
          ],
        ),
      ),
    );
  }
}
