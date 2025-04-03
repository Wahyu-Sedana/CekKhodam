import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../styles/style.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/responsive.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkButtonColor,
        padding: const EdgeInsets.symmetric(
            horizontal: paddingsizeMedium, vertical: paddingsizeSmall),
        elevation: 0.0,
        minimumSize: Size(0, typeMobile ? 0 : 4.8.h),
        fixedSize: Size(widget.width ?? 180.0, widget.height ?? 45.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizeLarge),
        ),
      ),
      onPressed: widget.onPressed,
      child: AutoSizeText(
        widget.text,
        style: whiteTextStyle,
        minFontSize: textExtrasmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
