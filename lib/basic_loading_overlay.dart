library basic_loading_overlay;

import 'package:flutter/material.dart';

/// A loading overlays.

class BasicLoadingOverlay extends StatelessWidget {
  const BasicLoadingOverlay({
    this.backgroundColor = Colors.transparent,
    this.loadingIndicatorColor = Colors.deepOrangeAccent,
    Key? key,
  }) : super(key: key);

  final Color backgroundColor;
  final Color loadingIndicatorColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
          color: loadingIndicatorColor,
        ),
      ),
    );
  }
}
