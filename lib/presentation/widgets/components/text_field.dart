
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';

class TextEditField extends StatefulWidget {
  const TextEditField({
    super.key,
    required this.context,
    this.autoFocus = false,
    this.hintText = '',
    required this.controller,
    this.textInputType = TextInputType.text,
    this.text,
    this.enabled = true,
    this.currentFocusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.isObscureText = false,
    this.textInputFormatter,
    this.onTextChanged,
    this.fillColor = Palette.obsolete,
    this.outlineBorderColor = Palette.obsolete,
    this.outlineBorderWidth = 1,
    this.hintStyle,
    this.textStyle,
    this.isRequire = false,
    this.readOnly = false,
    this.maxLength,
    this.onSubmitted,
    this.textLabel,
    this.validator,
    this.suffixTextWidget,
    this.prefixTextWidget,
    this.minLines,
    this.maxLines,
    this.counterText = '',
    this.enabledInputBorder,
    this.borderRadius = Spacings.cardBorderRadius,
    this.autocorrect = false,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: Spacings.custom15,
      horizontal: Spacings.medium,
    ),
  });

  final BuildContext context;

  final String? hintText;

  final String? text;

  final bool? enabled;
  final bool autoFocus;

  final bool? isObscureText;

  final TextInputType? textInputType;

  final TextEditingController? controller;

  final TextInputAction? textInputAction;

  final FocusNode? currentFocusNode;

  final FocusNode? nextFocusNode;

  final List<TextInputFormatter>? textInputFormatter;

  final ValueChanged<String>? onTextChanged;
  final int? maxLength;

  final Color fillColor;
  final Color outlineBorderColor;
  final double outlineBorderWidth;

  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  final bool readOnly;
  final ValueChanged<String>? onSubmitted;
  final String? textLabel;
  final FormFieldValidator<String>? validator;

  final Widget? suffixTextWidget;
  final Widget? prefixTextWidget;

  final int? minLines;
  final int? maxLines;
  final String? counterText;
  final InputBorder? enabledInputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final bool autocorrect;
  final bool isRequire;

  @override
  TextEditFieldState createState() => TextEditFieldState();
}

class TextEditFieldState extends State<TextEditField> {
  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  void didUpdateWidget(TextEditField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      widget.controller!.text = widget.text!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      cursorColor: Palette.primaryColor,
      obscureText: widget.isObscureText!,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      readOnly: widget.readOnly,
      focusNode: widget.currentFocusNode,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      autocorrect: widget.autocorrect,
      validator: widget.validator,
      onFieldSubmitted: (String value) {
        widget.onSubmitted?.call(value);
      },
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        counterText: widget.counterText,
        border: widget.enabledInputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.outlineBorderColor,
                width: widget.outlineBorderWidth,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palette.obsolete,
            width: widget.outlineBorderWidth,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        filled: true,
        prefixIcon: widget.prefixTextWidget != null
            ? Padding(
                padding: const EdgeInsets.only(
                    left: Spacings.medium, right: Spacings.cardBorderRadius),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[widget.prefixTextWidget!],
                ),
              )
            : null,
        suffixIcon: widget.suffixTextWidget != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.suffixTextWidget!,
                ],
              )
            : null,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyles.textFieldHintStyle(
                color: Palette.lightBlackColor.withOpacity(0.3)),
        enabledBorder: widget.enabledInputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.outlineBorderColor,
                width: widget.outlineBorderWidth,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
      ),
      style: widget.textStyle ??
          TextStyles.textFieldHintStyle(
            color: Palette.lightBlackColor,
            fontWeight: FontWeight.w400,
          ),
      onChanged: (String value) => widget.onTextChanged?.call(value),
    );
  }
}
