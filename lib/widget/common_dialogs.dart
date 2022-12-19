import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_demo/widget/colors.dart';
import 'package:map_demo/widget/common_gaps.dart';
import 'package:map_demo/widget/common_text_styles.dart';
import 'package:map_demo/widget/dimens.dart';

import 'common_button.dart';

Future showCommonDialog({
  String? iconImage,
  required String firstButtonText,
  required Function() firstButtonCallback,
  bool dismissible = true,
  String? title,
  String message = "message",
  String? secondButtonText,
  Function()? secondButtonCallback,
  EdgeInsetsGeometry? paddingFirstButton,
  EdgeInsetsGeometry? paddingSecondButton,
}) {
  return Get.dialog(
      WillPopScope(
        onWillPop: () async => dismissible,
        child: CommonDialog(
          iconImage: iconImage,
          title: title,
          firstButtonText: firstButtonText,
          firstButtonCallback: firstButtonCallback,
          secondButtonCallback: secondButtonCallback,
          secondButtonText: secondButtonText,
          message: message,
          paddingFirstButton: paddingFirstButton,
          paddingSecondButton: paddingSecondButton,
        ),
      ),
      barrierDismissible: dismissible);
}

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    Key? key,
    this.title,
    this.message,
    this.iconImage,
    required this.firstButtonText,
    required this.firstButtonCallback,
    this.firstButtonColor,
    this.secondButtonText,
    this.secondButtonCallback,
    this.secondButtonColor,
    this.paddingFirstButton,
    this.paddingSecondButton,
  }) : super(key: key);

  final Function()? secondButtonCallback;
  final Function() firstButtonCallback;
  final Color? firstButtonColor;
  final String firstButtonText;
  final String? message;
  final Color? secondButtonColor;
  final String? secondButtonText;
  final String? title;
  final String? iconImage;
  final EdgeInsetsGeometry? paddingFirstButton;
  final EdgeInsetsGeometry? paddingSecondButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(DimensRes.sp24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DimensRes.sp16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensRes.sp16),
          color: ColorsRes.white,
        ),
        padding: const EdgeInsets.all(DimensRes.sp24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title != null)
              Column(
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: CommonTextStyles.mediumBold,
                  ),
                  Gaps.vGap16,
                ],
              ),
            if (message != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DimensRes.sp8),
                child: Text(message!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CommonTextStyles.medium),
              ),
            Gaps.vGap24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (secondButtonText != null)
                  Expanded(
                    child: CommonButton(
                      padding: paddingSecondButton ??
                          const EdgeInsets.symmetric(
                            vertical: DimensRes.sp12,
                            horizontal: DimensRes.sp20,
                          ),
                      borderSide: const BorderSide(color: ColorsRes.primary),
                      textStyle: CommonTextStyles.mediumBold
                          .copyWith(color: ColorsRes.primary),
                      backgroundColor: Colors.transparent,
                      onPressed: secondButtonCallback!,
                      title: secondButtonText ?? '',
                    ),
                  ),
                if (secondButtonText != null) Gaps.hGap12,
                Expanded(
                  child: CommonButton(
                    onPressed: firstButtonCallback,
                    title: firstButtonText,
                    padding: paddingFirstButton ??
                        const EdgeInsets.symmetric(vertical: DimensRes.sp12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
