import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

class DiscographyService {
  static const String _iTunesEndpoint =
      'https://itunes.apple.com/search?term=Hearts2Hearts&entity=album';

  static const String officialSpotifyArtistUrl =
      'https://open.spotify.com/search/Hearts2Hearts';

  static const String officialAppleMusicArtistUrl =
      'https://music.apple.com/search?term=Hearts2Hearts';

  /// Fallback albums if device is offline or API fails
  static final List<AlbumModel> _fallbackAlbums = [
    const AlbumModel(
      collectionId: 'local_focus',
      title: 'FOCUS (The 1st Mini Album · 2025)',
      releaseDate: '2025',
      artworkUrl: 'lib/assets/FOCUS.png',
      trackCount: 5,
      tracks: ['FOCUS', 'Apple Pie', 'Pretty Please', 'Flutter', 'Blue Moon'],
      spotifyUrl: 'https://open.spotify.com/search/FOCUS%20Hearts2Hearts',
    ),
    const AlbumModel(
      collectionId: 'local_style',
      title: 'STYLE (Digital Single · 2025)',
      releaseDate: '2025',
      artworkUrl: 'lib/assets/STYLE.png',
      trackCount: 1,
      tracks: ['STYLE'],
      spotifyUrl: 'https://open.spotify.com/search/STYLE%20Hearts2Hearts',
    ),
    const AlbumModel(
      collectionId: 'local_chase',
      title: 'The Chase (Debut Single · 2025)',
      releaseDate: '2025',
      artworkUrl: 'lib/assets/The_Chase.png',
      trackCount: 2,
      tracks: ['The Chase', 'Butterflies'],
      spotifyUrl: 'https://open.spotify.com/search/The%20Chase%20Hearts2Hearts',
    ),
    const AlbumModel(
      collectionId: 'local_pretty',
      title: 'Pretty Please (Special Single · 2025)',
      releaseDate: '2025',
      artworkUrl: 'lib/assets/Pretty_Please.png',
      trackCount: 1,
      tracks: ['Pretty Please'],
      spotifyUrl: 'https://open.spotify.com/search/Pretty%20Please%20Hearts2Hearts',
    ),
  ];

  /// Fetches albums live from iTunes Music Search API dynamically
  static Future<List<AlbumModel>> fetchAlbums() async {
    try {
      final response = await http
          .get(Uri.parse(_iTunesEndpoint))
          .timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'] ?? [];

        final List<AlbumModel> liveAlbums = [];

        for (final item in results) {
          final artist = (item['artistName'] ?? '').toString().toLowerCase();

          // Filter only genuine Hearts2Hearts releases
          if (artist.contains('hearts2hearts') || artist == 'hearts2hearts') {
            liveAlbums.add(AlbumModel.fromITunesJson(item));
          }
        }

        if (liveAlbums.isNotEmpty) {
          return liveAlbums;
        }
      }
    } catch (_) {
      // Graceful fallback on network error/timeout
    }

    return _fallbackAlbums;
  }
}
