import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_teste/app/widgets/input/poke_teste_input_base.dart';
import '../../style/poke_teste_icons.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String value) onChange;
  final Function() onSubmit;
  final String placeholder;
  final Widget? suffixIcon;
  final double? fontSize;
  final TextStyle? textStyle;
  final FocusNode? focusNode;

  const SearchInput({
    super.key,
    required this.textEditingController,
    required this.placeholder,
    required this.onChange,
    required this.onSubmit,
    this.suffixIcon,
    this.fontSize,
    this.textStyle,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Poke_testeInputBase(
      autoFocus: false,
      inputFormater: [FilteringTextInputFormatter.singleLineFormatter],
      keyboardType: TextInputType.text,
      onChange: (value) => onChange(value),
      onSubmit: () => onSubmit(),
      placeholder: placeholder,
      textController: textEditingController,
      suffixIcon: const Poke_testeIcon(
        icon: Poke_testeIconsEnum.pokebola,
        width: 37,
        height: 25,
      ),
    );
  }
}
