import 'package:flutter/material.dart';
import 'package:similar_flutter/similar_flutter.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text('Result: `\n${diff(
            text1: "Hello World\nThis is the second line.\nThis is the third.",
            text2:
                "Hellol Welt\nThis is the second line\nThis is life.\nMoar and more",
          )}`'),
        ),
      ),
    );
  }
}
