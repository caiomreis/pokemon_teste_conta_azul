import 'package:flutter/material.dart';

import 'poke_teste_input_base.dart';

class MessageTextbox extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String value) onChange;
  final Function() onSubmit;
  final String placeholder;
  final Widget? suffixIcon;
  final double? fontSize;
  final TextStyle? textStyle;
  final bool? readOnly;
  final FocusNode? focusNode;

  MessageTextbox({
    required this.textEditingController,
    required this.placeholder,
    required this.onChange,
    required this.onSubmit,
    this.suffixIcon,
    this.fontSize,
    this.textStyle,
    this.readOnly,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Poke_testeInputBase(
      autoFocus: false,
      autoCorrect: true,
      keyboardType: TextInputType.text,
      onChange: (value) => onChange(value),
      onSubmit: () => onSubmit(),
      placeholder: placeholder,
      textController: textEditingController,
      expandedInputLines: 3,
    );
  }
}
