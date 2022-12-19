import 'package:flutter/material.dart';
import 'package:map_demo/widget/colors.dart';
import 'package:map_demo/widget/common_text_styles.dart';
import 'package:map_demo/widget/dimens.dart';

import 'common_gaps.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.formKey,
    this.backgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(
      vertical: DimensRes.sp16,
      horizontal: DimensRes.sp50,
    ),
    this.borderRadius = DimensRes.sp8,
    this.borderSide = BorderSide.none,
    this.isDisable = false,
    this.leadingIcon,
  }) : super(key: key);

  final GlobalKey<FormState>? formKey;
  final Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BorderSide borderSide;
  final bool isDisable;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable
          ? null
          : () {
              if (formKey != null) {
                final currentState = formKey!.currentState;
                if (currentState == null || !currentState.validate()) {
                  return;
                }
              }
              onPressed!();
            },
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorsRes.textDisable.withOpacity(0.2);
            }
            return ColorsRes.primary;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => isDisable
              ? ColorsRes.buttonDisable
              : backgroundColor ?? ColorsRes.primary,
        ),
        padding: MaterialStateProperty.resolveWith((states) => padding),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: borderSide,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) leadingIcon!,
          if (leadingIcon != null) Gaps.hGap10,
          Flexible(
            child: Text(
              title,
              style: textStyle ??
                  CommonTextStyles.medium.copyWith(color: ColorsRes.white),
              textAlign: TextAlign.center,
              softWrap: false,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
