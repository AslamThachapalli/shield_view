A Flutter package for blocking the app's screen view by blurring it when the app is in the background.

## Usage

Import the package as:

```dart
import 'package:shield_view/shield_view.dart';
```

If you want to blur the whole app while it is in the background:

```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  builder: (context, child) {
  // Wrapping with ShieldView like this will Shield the whole app.
  return ShieldView(child: child!);
  },
  home: const HomePage(),
)
```

If you want to blur any specific page, just wrap the page with `ShieldView`.
```dart
ShieldView(child: HomePage());
```
