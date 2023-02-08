import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());
// => is arrow syntax it is used when fuction body is only single line of code
// the same shit as:
// void main() {
//   runApp(
//     XylophoneApp(),
//   );
// }

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$noteNumber.wav'),
    );
  }

  Expanded buildKey({color, selectNote}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(selectNote);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.redAccent, selectNote: 1),
              buildKey(color: Colors.orangeAccent, selectNote: 2),
              buildKey(color: Colors.yellowAccent, selectNote: 3),
              buildKey(color: Colors.greenAccent.shade400, selectNote: 4),
              buildKey(color: Colors.green.shade700, selectNote: 5),
              buildKey(color: Colors.blueAccent, selectNote: 6),
              buildKey(color: Colors.purpleAccent, selectNote: 7),
            ],
          ),
        ),
      ),
    );
  }
}
