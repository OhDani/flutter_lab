import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MagicBallApp());
}

class MagicBallApp extends StatelessWidget {
  const MagicBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MagicBallPage(),
    );
  }
}

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int ballNumber = 1;
  final Random _random = Random();

  void getRandomBall() {
    setState(() {
      ballNumber = _random.nextInt(5) + 1; // random từ 1 → 5
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Magic 8 Ball"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: getRandomBall,
          child: Image.asset('assets/images/ball$ballNumber.png'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getRandomBall,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
