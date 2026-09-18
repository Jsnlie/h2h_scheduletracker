class YouTubePlaylist {
  final String id;
  final String title;
  final int videoCount;
  final String thumbnailUrl;
  final String playlistUrl;
  final String category; // 'Music Album', 'Behind the Scenes', 'Variety / Show'

  const YouTubePlaylist({
    required this.id,
    required this.title,
    required this.videoCount,
    required this.thumbnailUrl,
    required this.playlistUrl,
    required this.category,
  });
}

const String officialYouTubeChannelUrl = 'https://www.youtube.com/@hearts2hearts.official';

final List<YouTubePlaylist> officialPlaylists = [
  const YouTubePlaylist(
    id: 'p1',
    title: 'FOCUS - The 1st Mini Album',
    videoCount: 132,
    thumbnailUrl: 'lib/assets/FOCUS.png',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_-h3GjPzDfJPQL4Ihj3oHjx',
    category: 'Music Album',
  ),
  const YouTubePlaylist(
    id: 'p2',
    title: 'STYLE',
    videoCount: 54,
    thumbnailUrl: 'lib/assets/STYLE.png',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8__myYFMGzz1OcgJJdpph-Py',
    category: 'Music Album',
  ),
  const YouTubePlaylist(
    id: 'p3',
    title: 'The Chase',
    videoCount: 153,
    thumbnailUrl: 'lib/assets/The_Chase.png',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_-5QgGSuB6id9xJw6bLCFvE',
    category: 'Music Album',
  ),
  const YouTubePlaylist(
    id: 'p4',
    title: 'Daily BH2ND',
    videoCount: 27,
    thumbnailUrl: 'lib/assets/Daily_BH2ND.jpg',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_8Nad5Dc8ManzhEKDkRuocT',
    category: 'Behind the Scenes',
  ),
  const YouTubePlaylist(
    id: 'p5',
    title: 'Hearts Chase',
    videoCount: 11,
    thumbnailUrl: 'lib/assets/H_Chases.png',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_-qN8hVnfORFmmanYP3jSkB',
    category: 'Variety / Show',
  ),
  const YouTubePlaylist(
    id: 'p6',
    title: 'Production BH2ND',
    videoCount: 16,
    thumbnailUrl: 'lib/assets/BH2ND.jpg',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_8WSp0-1ZRQOPTEmrzYP1l7',
    category: 'Behind the Scenes',
  ),
  const YouTubePlaylist(
    id: 'p7',
    title: 'Crunchy Hearts',
    videoCount: 10,
    thumbnailUrl: 'lib/assets/Crunchy.jpg',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_97cfBuqzBvk7GcQmnj8nGk',
    category: 'Variety / Show',
  ),
  const YouTubePlaylist(
    id: 'p8',
    title: 'S2cret Diary',
    videoCount: 8,
    thumbnailUrl: 'lib/assets/Diary.jpg',
    playlistUrl: 'https://www.youtube.com/playlist?list=PLHhitGId-8_8qk290cECozARss-80la1H',
    category: 'Variety / Show',
  ),
];
