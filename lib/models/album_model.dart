class AlbumModel {
  final String collectionId;
  final String title;
  final String releaseDate;
  final String artworkUrl;
  final int trackCount;
  final List<String> tracks;
  final String? appleMusicUrl;
  final String spotifyUrl;

  const AlbumModel({
    required this.collectionId,
    required this.title,
    required this.releaseDate,
    required this.artworkUrl,
    required this.trackCount,
    required this.tracks,
    this.appleMusicUrl,
    this.spotifyUrl = 'https://open.spotify.com/search/Hearts2Hearts',
  });

  factory AlbumModel.fromITunesJson(Map<String, dynamic> json) {
    // Enhance artwork URL to 600x600 resolution
    String artwork = json['artworkUrl100'] ?? '';
    artwork = artwork.replaceAll('100x100bb', '600x600bb');

    final rawDate = json['releaseDate'] ?? '';
    final year = rawDate.length >= 4 ? rawDate.substring(0, 4) : '2025';

    final collectionName = json['collectionName'] ?? 'Hearts2Hearts Album';

    return AlbumModel(
      collectionId: json['collectionId']?.toString() ?? '',
      title: collectionName,
      releaseDate: year,
      artworkUrl: artwork,
      trackCount: json['trackCount'] ?? 1,
      tracks: [collectionName.split(' - ').first], // Title track preview
      appleMusicUrl: json['collectionViewUrl'],
      spotifyUrl: 'https://open.spotify.com/search/${Uri.encodeComponent(collectionName)}',
    );
  }
}
