import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('sounds/note$noteNumber.wav'));
  }

  Expanded buildKey({required Color color, required int sound}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () => playSound(sound),
        child: const SizedBox.expand(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, sound: 1),
            buildKey(color: Colors.orange, sound: 2),
            buildKey(color: Colors.yellow, sound: 3),
            buildKey(color: Colors.green, sound: 4),
            buildKey(color: Colors.teal, sound: 5),
            buildKey(color: Colors.blue, sound: 6),
            buildKey(color: Colors.purple, sound: 7),
          ],
        ),
      ),
    );
  }
}
