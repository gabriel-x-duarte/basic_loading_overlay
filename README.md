A basic modal loading overlay for Flutter applications.

## Features

- Displays a modal loading overlay.
- Prevents user interaction while visible.
- Prevents back navigation while visible.
- Customizable loading indicator color.
- Customizable loading indicator size.
- Customizable loading indicator stroke width.

## Usage

#### Show the loading overlay
```dart
LoadingOverlay.show(
  context: context,
);
```

#### Customize the loading indicator
```dart
LoadingOverlay.show(
  context: context,
  loadingIndicatorColor: Colors.redAccent,
  size: 50,
  strokeWidth: 6,
);
```

#### Dismiss the loading overlay
```dart
Navigator.of(context).pop();
```

## Additional information

If you find this package useful,
please consider giving it a like.
