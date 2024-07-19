import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class PaddingButton extends StatelessWidget {
  const PaddingButton({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: responsivePaddingButtonBottom,
            left: responsivePaddingButton,
            right: responsivePaddingButton),
        child: child);
  }
}
