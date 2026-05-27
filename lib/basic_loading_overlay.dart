import 'package:flutter/material.dart';

const Color _kDefaultColor = Colors.deepOrangeAccent;

const double _kDefaultSize = 35;

const double _kDefaultStrokeWidth = 4;

/// Utility class for displaying a loading overlay.
///
/// Example:
///
/// ```dart
/// LoadingOverlay.show(
///   context: context,
/// );
/// ```
///
/// To close the overlay:
///
/// ```dart
/// Navigator.of(context).pop();
/// ```
abstract final class LoadingOverlay {
  /// Displays a modal loading overlay.
  ///
  /// The overlay prevents user interaction and blocks back navigation
  /// until it is manually dismissed.
  ///
  /// The [loadingIndicatorColor] defines the color of the loading indicator.
  /// The default value is [Colors.deepOrangeAccent].
  ///
  /// The [size] defines the width and height of the loading indicator.
  /// The default value is `35`.
  ///
  /// The [strokeWidth] defines the thickness of the loading indicator.
  /// The default value is `4`.
  ///
  /// To dismiss the overlay:
  ///
  /// ```dart
  /// Navigator.of(context).pop();
  /// ```
  static Future<void> show({
    required BuildContext context,
    Color? loadingIndicatorColor,
    double? size,
    double? strokeWidth,
  }) async {
    final resolvedIndicatorColor = loadingIndicatorColor ?? _kDefaultColor;
    final resolvedSize = size ?? _kDefaultSize;
    final resolvedStrokeWidth = strokeWidth ?? _kDefaultStrokeWidth;

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return _BasicLoadingOverlay(
          loadingIndicatorColor: resolvedIndicatorColor,
          size: resolvedSize,
          strokeWidth: resolvedStrokeWidth,
        );
      },
    );
  }
}

class _BasicLoadingOverlay extends StatelessWidget {
  const _BasicLoadingOverlay({
    required this.loadingIndicatorColor,
    required this.size,
    required this.strokeWidth,
  })  : assert(size > 0),
        assert(strokeWidth > 0);

  final Color loadingIndicatorColor;
  final double size;
  final double strokeWidth;

  final Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: _backgroundColor,
        elevation: 0,
        child: Center(
          child: SizedBox.square(
            dimension: size,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircularProgressIndicator(
                color: loadingIndicatorColor,
                backgroundColor: _backgroundColor,
                strokeWidth: strokeWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
