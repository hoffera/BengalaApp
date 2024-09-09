import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundButton extends StatelessWidget {
  SoundButton({super.key});
  final player = AudioPlayer();

  Future<void> _playSound() async {
    String audioUrl =
        "https://drive.google.com/uc?export=download&id=1SGCJVdQlRk3gnaffgYiUsJTBTDto6wAg"; // Substitua pela URL real do seu áudio
    await player.setUrl(audioUrl);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: IconButton(
        onPressed: _playSound,
        iconSize: 50,
        icon: const Icon(Icons.volume_down_alt),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Sound Button')),
      body: Center(child: SoundButton()),
    ),
  ));
}
