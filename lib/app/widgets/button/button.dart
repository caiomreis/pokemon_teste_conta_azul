// ignore_for_file: camel_case_types

import 'package:poke_teste/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_teste/app/style/poke_teste_icons.dart';

enum ButtonColorEnum { blue, red }

class Poke_testeButton extends StatelessWidget {
  final String text;
  final ButtonColorEnum? color;
  final Poke_testeIconsEnum? leftIcon;
  final Poke_testeIconsEnum? rightIcon;
  final bool? isLoading;
  final bool? disable;
  final Function()? onPress;

  const Poke_testeButton({
    super.key,
    required this.text,
    this.color,
    this.onPress,
    this.leftIcon,
    this.isLoading = false,
    this.rightIcon,
    this.disable = false,
  });

  factory Poke_testeButton.rightIcon({
    required String text,
    final ButtonColorEnum? color,
    final bool? isLoading,
    final Poke_testeIconsEnum? icon,
    final Function()? onPress,
    final bool? disable,
  }) {
    return Poke_testeButton(
      text: text,
      color: color,
      isLoading: isLoading ?? false,
      rightIcon: icon,
      onPress: onPress,
      disable: disable ?? false,
    );
  }
  factory Poke_testeButton.leftIcon({
    required String text,
    final ButtonColorEnum? color,
    final bool? isLoading,
    final Poke_testeIconsEnum? icon,
    final Function()? onPress,
    final bool? disable,
  }) {
    return Poke_testeButton(
      text: text,
      color: color,
      isLoading: isLoading ?? false,
      leftIcon: icon,
      onPress: onPress,
      disable: disable ?? false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!isLoading!) {
          if (!disable!) onPress?.call();
        }
      },
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed) && !disable!) {
            return color == ButtonColorEnum.blue
                ? Poke_Teste_Colors.theme.blue.light
                : Poke_Teste_Colors.theme.red.strong;
          }

          return _backgroundColor();
        }),
      ),
      child: isLoading!
          ? Container(
              alignment: Alignment.center,
              width: 42,
              height: 42,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: _textButtonColor(),
                  strokeWidth: 2,
                ),
              ),
            )
          : AnimatedContainer(
              height: 42,
              duration: const Duration(milliseconds: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (leftIcon != null) _buttonIcons(),
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      color: _textButtonColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      textBaseline: TextBaseline.ideographic,
                    ),
                  ),
                  if (rightIcon != null) _buttonIcons(),
                ],
              ),
            ),
    );
  }

  Color _textButtonColor() {
    if (color == ButtonColorEnum.blue && disable!) {
      return const Color.fromRGBO(172, 181, 189, 1);
    }
    if (color == ButtonColorEnum.blue) return Poke_Teste_Colors.theme.blue.base;

    if (disable!) return const Color(0x7FFC7048);
    return Poke_Teste_Colors.theme.neutral.white;
  }

  Color _backgroundColor() {
    if (color == ButtonColorEnum.blue && disable!) {
      return const Color.fromRGBO(192, 192, 192, 0.15);
    }
    if (color == ButtonColorEnum.blue) {
      return Poke_Teste_Colors.theme.blue.light;
    }

    if (disable!) return const Color(0xFFFFF5F5);
    return Poke_Teste_Colors.theme.red.medium;
  }

  Widget _buttonIcons() {
    return Row(
      children: [
        if (rightIcon != null) const SizedBox(width: 4),
        if (leftIcon != null || rightIcon != null)
          Poke_testeIcon(
            color: _textButtonColor(),
            icon: leftIcon != null ? leftIcon! : rightIcon!,
            width: 20,
            height: 20,
            areaHeight: 24,
            areaWidth: 24,
          ),
        if (leftIcon != null) const SizedBox(width: 4),
      ],
    );
  }
}
