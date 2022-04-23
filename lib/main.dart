import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'clock_screen.dart';
import 'fake_api_call.dart';
import 'counter_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClockScreen(),
      // home: const FakeApiCall(),
      // home: const CounterApp(),
    );
  }
}
