library basic_loading_overlay;

import 'package:flutter/material.dart';

const Color _kDefaultColor = Colors.deepOrangeAccent;

const double _kDefaultSize = 35;

/// A loading overlay.
class BasicLoadingOverlay extends StatelessWidget {
  /// [_kDefaultColor] value is [Colors.deepOrangeAccent]
  ///
  /// [_kDefaultSize] value is 35
  const BasicLoadingOverlay({
    this.loadingIndicatorColor = _kDefaultColor,
    this.size = _kDefaultSize,
    super.key,
  });

  final Color loadingIndicatorColor;
  final double size;

  final Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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

abstract class LoadingOverlay {
  static Future<void> show({
    required BuildContext context,
    Color? loadingIndicatorColor,
    double? size,
  }) async {
    loadingIndicatorColor ??= _kDefaultColor;
    size ??= _kDefaultSize;

    return showDialog(
      context: context,
      builder: (context) {
        return BasicLoadingOverlay(
          loadingIndicatorColor: loadingIndicatorColor!,
          size: size!,
        );
      },
    );
  }
}
