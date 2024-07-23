import 'package:poke_teste/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  final FontWeight? fontWeight;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;

  const Label({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textDecoration,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
  });

  factory Label.light({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Label(
      text: text,
      fontWeight: FontWeight.w300,
      color: color,
      textAlign: textAlign,
      textDecoration: textDecoration,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      letterSpacing: letterSpacing,
    );
  }
  factory Label.medium({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Label(
      text: text,
      fontWeight: FontWeight.w500,
      color: color,
      textAlign: textAlign,
      textDecoration: textDecoration,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      letterSpacing: letterSpacing,
    );
  }
  factory Label.bold({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Label(
      text: text,
      fontWeight: FontWeight.w700,
      color: color,
      textAlign: textAlign,
      textDecoration: textDecoration,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      letterSpacing: letterSpacing,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: const Key('Label'),
      textAlign: textAlign ?? TextAlign.start,
      softWrap: softWrap ?? false,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 12,
      style: GoogleFonts.poppins(
        color: color ?? Poke_testeColors.theme.gray.strong,
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
