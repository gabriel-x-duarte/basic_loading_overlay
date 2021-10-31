library basic_loading_overlay;

import 'package:flutter/material.dart';

/// A loading overlay.
class BasicLoadingOverlay extends StatelessWidget {
  const BasicLoadingOverlay({
    this.loadingIndicatorColor = Colors.deepOrangeAccent,
    this.size = 35,
    Key? key,
  }) : super(key: key);

  final Color loadingIndicatorColor;
  final double size;

  final Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: _backgroundColor,
        elevation: 0,
        child: Center(
          child: SizedBox(
            height: size,
            width: size,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircularProgressIndicator(
                color: loadingIndicatorColor,
                backgroundColor: _backgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
