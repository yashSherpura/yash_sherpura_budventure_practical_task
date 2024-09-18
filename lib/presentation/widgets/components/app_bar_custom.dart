import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    this.onBackPress,
    this.isShowBackButton = false,
    this.actions,
    this.titleMaxLine = 1,
    this.prefixIcon,
  });

  final String title;
  final bool isShowBackButton;
  final VoidCallback? onBackPress;
  final List<Widget>? actions;
  final int titleMaxLine;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.medium),
        child: TextLabel(
          text: title,
          textStyle: TextStyles.titleMedium(
            color: Palette.blackColor,
            size: 24
          ),
          maxLines: titleMaxLine,
        ),
      ),
    );
  }
}
