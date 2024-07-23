import 'package:poke_teste/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final FontWeight? fontWeight;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final double? fontSize;
  final double? height;

  const Body({
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
  Body copyWith({
    final double? fontSize,
    final double? height,
  }) {
    return Body(
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

  factory Body.light({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Body(
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
  factory Body.medium({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Body(
      text: text,
      fontWeight: FontWeight.w400,
      color: color,
      textAlign: textAlign,
      textDecoration: textDecoration,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      letterSpacing: letterSpacing,
    );
  }
  factory Body.bold({
    required String text,
    final Color? color,
    final TextAlign? textAlign,
    final TextDecoration? textDecoration,
    final bool? softWrap,
    final TextOverflow? overflow,
    final int? maxLines,
    final double? letterSpacing,
  }) {
    return Body(
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
      key: const Key('Body'),
      textAlign: textAlign ?? TextAlign.start,
      softWrap: softWrap ?? false,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 12,
      style: GoogleFonts.poppins(
        color: color ?? Poke_testeColors.theme.gray.strong,
        fontSize: fontSize ?? 14,
        height: height ?? 1.40,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }
}
