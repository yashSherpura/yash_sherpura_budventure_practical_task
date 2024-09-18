import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';

/// TextTitle
class TextLabel extends StatelessWidget {
  /// Constructor
  const TextLabel({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.visible,
  });

  final String? text;

  final TextAlign textAlign;

  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: overflow,
      style: textStyle ?? TextStyles.normal(),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
