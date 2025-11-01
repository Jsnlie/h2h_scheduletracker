import 'package:flutter/material.dart';
import '../widgets/music_card.dart';

class DiscographyScreen extends StatelessWidget {
  const DiscographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: discography());
  }

  Widget discography() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          MusicCard(
            albumCover: 'lib/assets/The_Chase.png',
            title: 'The Chase (2025)',
            trackList: ['The Chase', 'Butterflies'],
          ),
          MusicCard(
            albumCover: 'lib/assets/STYLE.png',
            title: 'STYLE (2025)',
            trackList: ['STYLE'],
          ),
          MusicCard(
            albumCover: 'lib/assets/Pretty_Please.png',
            title: 'Pretty Please (2025)',
            trackList: ['Pretty Please'],
          ),
          MusicCard(
            albumCover: 'lib/assets/FOCUS.png',
            title: 'FOCUS (2025)',
            trackList: [
              'FOCUS',
              'Apple Pie',
              'Pretty Please',
              'Flutter',
              'Blue Moon',
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Discography',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    );
  }
}
