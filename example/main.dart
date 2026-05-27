import 'package:flutter/material.dart';

import 'package:basic_loading_overlay/basic_loading_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Loading Overlay',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Basic Loading Overlay',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Press the button to display a loading overlay. '
                'The overlay will remain visible for the same number '
                'of seconds as the button press count.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'You have pressed the button this many times:',
              ),
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showOverlay,
        tooltip: 'Increment counter and show loading overlay',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _showOverlay() async {
    _incrementCounter();

    Future.delayed(
      Duration(seconds: _counter),
      () {
        if (!mounted) {
          return;
        }

        Navigator.of(context).pop();
      },
    );

    LoadingOverlay.show(
      context: context,
    );
  }
}
