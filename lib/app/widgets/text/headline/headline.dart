import 'package:poke_teste/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headline extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? fontSize;
  final double? height;

  const Headline({
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
    this.fontSize,
    this.height,
  });
  Headline copyWith({
    final double? fontSize,
    final double? height,
  }) {
    return Headline(
      text: text,
      fontSize: fontSize ?? this.fontSize,
      height: height ?? this.height,
      fontWeight: fontWeight,
      color: color,
      textAlign: textAlign,
      textDecoration: textDecoration,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      letterSpacing: letterSpacing,
    );
  }

  factory Headline.light({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Headline(
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
  factory Headline.medium({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Headline(
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
  factory Headline.bold({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Headline(
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
      key: const Key('Headline'),
      textAlign: textAlign ?? TextAlign.start,
      softWrap: softWrap ?? false,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 12,
      style: GoogleFonts.poppins(
        color: color ?? Poke_testeColors.theme.gray.strong,
        fontSize: fontSize ?? 20,
        height: 1.20,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
