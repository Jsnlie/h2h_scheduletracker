import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  final String albumCover;
  final String title;
  final List<String> trackList;

  const MusicCard({
    super.key,
    required this.albumCover,
    required this.title,
    required this.trackList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFABD5FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              albumCover,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          //Album Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                //Track List
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: trackList.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final song = entry.value;
                    return Text(
                      "$index. $song",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
