import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({
    super.key,
    this.message = StringConstants.messageLoading,
    this.isCard = true,
    this.isCurve = false,
    this.color = Palette.whiteColor,
    this.isOpacity = false,
    this.height,
    this.width,
  });

  final String message;
  final bool isCard;
  final Color color;
  final bool isOpacity;
  final bool isCurve;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return isCard
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isCurve ? Spacings.custom20 : 0),
                topRight: Radius.circular(isCurve ? Spacings.custom20 : 0),
              ),
            ),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: width == null
                    ? MediaQuery.of(context).size.width * 0.5
                    : width! * 0.5,
                height: height == null
                    ? MediaQuery.of(context).size.height * 0.25
                    : height! * 0.25,
                child: Material(
                  color: Palette.obsolete,
                  borderRadius: BorderRadius.circular(Spacings.mini),
                  child: Padding(
                    padding: const EdgeInsets.all(Spacings.medium),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Palette.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: Spacings.xLarge,
                        ),
                        TextLabel(text: message),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : const Center(
            child: SizedBox(
              height: Spacings.xxLarge,
              width: Spacings.xxLarge,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Palette.primaryColor),
              ),
            ),
          );
  }
}
