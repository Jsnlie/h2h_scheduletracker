import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_colors.dart';

class MusicCard extends StatelessWidget {
  final String albumCover;
  final String title;
  final List<String> trackList;
  final String? releaseYear;
  final String? spotifyUrl;
  final String? appleMusicUrl;

  const MusicCard({
    super.key,
    required this.albumCover,
    required this.title,
    required this.trackList,
    this.releaseYear,
    this.spotifyUrl,
    this.appleMusicUrl,
  });

  Future<void> _launch(BuildContext context, String? urlString) async {
    if (urlString == null || urlString.isEmpty) return;
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open $urlString')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNetwork = albumCover.startsWith('http');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Album Cover with rounded corners & shadow
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: isNetwork
                      ? Image.network(
                          albumCover,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 96,
                            height: 96,
                            color: AppColors.primaryLight,
                            child: const Icon(
                              Icons.album,
                              size: 40,
                              color: AppColors.primary,
                            ),
                          ),
                        )
                      : Image.asset(
                          albumCover,
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 16),

              // Album Info & Track List
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (releaseYear != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Released: $releaseYear',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    const Divider(height: 1, color: AppColors.border),
                    const SizedBox(height: 8),

                    // Track list
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: trackList.asMap().entries.map((entry) {
                        final index = entry.key + 1;
                        final song = entry.value;
                        final isTitleTrack = index == 1;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.5),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isTitleTrack
                                      ? AppColors.primaryLight
                                      : Colors.grey[100],
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '$index',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: isTitleTrack
                                        ? AppColors.primaryDark
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  song,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: isTitleTrack
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color: isTitleTrack
                                        ? AppColors.textPrimary
                                        : AppColors.textSecondary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (isTitleTrack)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentPinkLight,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    'TITLE',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.accentPink,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Streaming Action Buttons (Spotify & Apple Music)
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _launch(
                    context,
                    spotifyUrl ??
                        'https://open.spotify.com/search/${Uri.encodeComponent(title)}',
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.spotify,
                    size: 15,
                    color: Color(0xFF1DB954),
                  ),
                  label: const Text(
                    'Spotify',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1DB954),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF1DB954)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _launch(
                    context,
                    appleMusicUrl ??
                        'https://music.apple.com/search?term=${Uri.encodeComponent(title)}',
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.apple,
                    size: 15,
                    color: Color(0xFFFA243C),
                  ),
                  label: const Text(
                    'Apple Music',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFA243C),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFA243C)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
