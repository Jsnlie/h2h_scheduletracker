import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_colors.dart';

class GroupInfo extends StatelessWidget {
  const GroupInfo({super.key});

  Future<void> _launchURL(BuildContext context, String urlString) async {
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
          SnackBar(content: Text('Error launching URL: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Group Logo with animated-style border
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'lib/assets/h2h_logo.png',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Group Name
          const Text(
            'Hearts2Hearts',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),

          // Subtitle / Label
          const Text(
            'SM Entertainment · 8 Members · Debuted Feb 2025',
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),

          // Fandom & Official Color Badges
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accentPinkLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('💖 ', style: TextStyle(fontSize: 12)),
                    Text(
                      'Fandom: S2U (Ha-chu)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentPink,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 10, color: AppColors.primary),
                    SizedBox(width: 4),
                    Text(
                      'Color: Sky Blue',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.border),
          const SizedBox(height: 12),

          // Social Media Links
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialBtn(
                context,
                icon: const FaIcon(FontAwesomeIcons.xTwitter, size: 18, color: Colors.black87),
                tooltip: 'X (Twitter)',
                url: 'https://x.com/Hearts2Hearts',
              ),
              _buildSocialBtn(
                context,
                icon: const FaIcon(FontAwesomeIcons.instagram, size: 18, color: Color(0xFFE1306C)),
                tooltip: 'Instagram',
                url: 'https://www.instagram.com/hearts2hearts',
              ),
              _buildSocialBtn(
                context,
                icon: const FaIcon(FontAwesomeIcons.youtube, size: 18, color: Color(0xFFFF0000)),
                tooltip: 'YouTube',
                url: 'https://www.youtube.com/@hearts2hearts.official',
              ),
              _buildSocialBtn(
                context,
                icon: const FaIcon(FontAwesomeIcons.tiktok, size: 18, color: Colors.black),
                tooltip: 'TikTok',
                url: 'https://www.tiktok.com/@hearts2hearts',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(
    BuildContext context, {
    required Widget icon,
    required String tooltip,
    required String url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => _launchURL(context, url),
        tooltip: tooltip,
      ),
    );
  }
}
