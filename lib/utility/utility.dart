import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';

class Utility {
  static void showLog(String value, {String key = 'Result : '}) {
    log('$key : $value');
  }

  static void showCenterFlash({
    required String message,
    bool isSuccess = false,
    int duration = 3,
    required BuildContext context,
  }) {
    context.showFlash(
      duration: Duration(seconds: duration),
      barrierDismissible: true,
      builder: (BuildContext _, FlashController<dynamic> controller) {
        return GestureDetector(
          onTap: () {
            controller.dismiss();
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            controller.dismiss();
          },
          onVerticalDragEnd: (DragEndDetails details) {
            controller.dismiss();
          },
          child: Flash<dynamic>(
            controller: controller,
            position: FlashPosition.bottom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(Spacings.large),
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Spacings.small),
                          color:
                              isSuccess ? Palette.primaryColor : Palette.error,
                          border: Border.all(
                            width: 2,
                            color: isSuccess
                                ? Palette.primaryColor
                                : Palette.error,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: Spacings.small,
                          bottom: Spacings.small,
                          left: Spacings.custom20,
                          right: Spacings.custom20,
                        ),
                        child: TextLabel(
                          text: message,
                          textStyle:
                              const TextStyle(decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Palette.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<int?> showDialogCustom({
    required BuildContext context,
    required String title,
    required String content,
    bool isSingleButton = false,
    bool barrierDismissible = false,
    String positiveButtonText = StringConstants.labelOk,
    String negativeButtonText = StringConstants.labelCancel,
  }) {
    return showDialog<int>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Spacings.custom15),
            topLeft: Radius.circular(Spacings.custom15),
            bottomRight: Radius.circular(Spacings.custom15),
            bottomLeft: Radius.circular(Spacings.custom15),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: Spacings.custom15,
                horizontal: Spacings.custom15,
              ),
              child: TextLabel(
                text: title,
                textStyle: TextStyles.header1(
                  fontWeight: FontWeight.bold,
                  color: Palette.primaryColor,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: Spacings.custom15,
                horizontal: Spacings.custom15,
              ),
              child: TextLabel(
                text: content,
                textStyle: TextStyles.normal(color: Palette.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: Spacings.custom15,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.all(Spacings.custom15),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    Spacings.custom5,
                  ),
                  bottom: Radius.circular(
                    Spacings.custom5,
                  ),
                ),
                color: Palette.primaryColor,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context, 0);
                      },
                      child: Center(
                        child: TextLabel(
                          text: positiveButtonText,
                          textStyle: TextStyles.normal(
                            color: Palette.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isSingleButton)
                    const SizedBox()
                  else
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.white,
                    ),
                  if (isSingleButton)
                    const SizedBox()
                  else
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, 1);
                        },
                        child: Center(
                          child: TextLabel(
                            text: negativeButtonText,
                            textStyle: TextStyles.normal(
                              color: Palette.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
