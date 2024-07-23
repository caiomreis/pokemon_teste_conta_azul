import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_teste/app/widgets/input/poke_teste_input_base.dart';
import '../../style/poke_teste_icons.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String value) onChange;
  final Function() onSubmit;
  final String placeholder;
  final Widget? suffixIcon;
  final double? fontSize;
  final TextStyle? textStyle;
  final bool obscureText;
  final FocusNode? focusNode;

  PasswordInput({
    required this.textEditingController,
    required this.placeholder,
    required this.onChange,
    required this.onSubmit,
    required this.obscureText,
    this.suffixIcon,
    this.fontSize,
    this.textStyle,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Poke_testeInputBase(
      obscureText: obscureText,
      autoFocus: false,
      inputFormater: [FilteringTextInputFormatter.singleLineFormatter],
      keyboardType: TextInputType.visiblePassword,
      onChange: (value) => onChange(value),
      onSubmit: () => onSubmit(),
      placeholder: placeholder,
      textController: textEditingController,
      suffixIcon: const Poke_testeIcon(
        icon: Poke_testeIconsEnum.view,
        width: 37,
        height: 25,
      ),
    );
  }
}
