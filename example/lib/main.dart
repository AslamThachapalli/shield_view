import 'package:flutter/material.dart';
import 'package:shield_view/shield_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shield View Example"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Move app background to see \n the shield effect',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
