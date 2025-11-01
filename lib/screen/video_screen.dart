import 'package:flutter/material.dart';
import '../widgets/video_card.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: videoPlaylist());
  }

  Widget videoPlaylist() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/FOCUS.png', 
            title: "FOCUS - The 1st Mini Album", 
            videoCount: 132, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_-h3GjPzDfJPQL4Ihj3oHjx"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/STYLE.png', 
            title: "STYLE", 
            videoCount: 54, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8__myYFMGzz1OcgJJdpph-Py"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/The_Chase.png', 
            title: "The Chase", 
            videoCount: 153, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_-5QgGSuB6id9xJw6bLCFvE"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/Daily_BH2ND.jpg', 
            title: "Daily BH2ND", 
            videoCount: 27, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_8Nad5Dc8ManzhEKDkRuocT"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/H_Chases.png', 
            title: "Hearts Chase", 
            videoCount: 11, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_-qN8hVnfORFmmanYP3jSkB"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/BH2ND.jpg', 
            title: "Production BH2ND", 
            videoCount: 16, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_8WSp0-1ZRQOPTEmrzYP1l7"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/Crunchy.jpg', 
            title: "Crunchy Hearts", 
            videoCount: 10, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_97cfBuqzBvk7GcQmnj8nGk"
          ),

          VideoPlaylistCard(
            thumbnailUrl: 'lib/assets/Diary.jpg', 
            title: "S2cret Diary", 
            videoCount: 8, 
            playlistUrl: "https://www.youtube.com/playlist?list=PLHhitGId-8_8qk290cECozARss-80la1H"
          ),
        ],
      ) 
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Videos',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }
}
