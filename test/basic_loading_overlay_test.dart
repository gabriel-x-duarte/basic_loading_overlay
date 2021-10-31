import 'package:flutter_test/flutter_test.dart';

import 'package:basic_loading_overlay/basic_loading_overlay.dart';

void main() {
  testWidgets('Basic loading overlay', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BasicLoadingOverlay());
  });
}
