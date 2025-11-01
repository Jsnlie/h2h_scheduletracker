import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupInfo extends StatelessWidget {
  const GroupInfo({super.key});

  Future<void> _launchURL(playlistUrl) async {
    final Uri url = Uri.parse(playlistUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $playlistUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFB3E5FC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Group Logo
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'lib/assets/h2h_logo.png',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Group Name
          const Text(
            'Hearts2Hearts',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          // Group Info
          const Text(
            'Kpop GirlGroup · 8 Members',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // Social Media Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.xTwitter),
                onPressed: () => _launchURL('x.com/Hearts2Hearts'),
                tooltip: 'Twitter',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram),
                onPressed: () => _launchURL(
                  'https://www.youtube.com/redirect?event=channel_description&redir_token=QUFFLUhqbHZOck9lOGpCaXN3REM5SEdKb212a0FpODN4d3xBQ3Jtc0tsS0VkaVMzMVZzTDNqQmh3YW5zS3h2aEFHbE9aVUV1bHZ5c1BVc2NCek9pQk94bTJtODFOQjlVTUZ3V1JuV3Z0M2hEcDhUaW1sVlFqN0lOQmluM2tOd0YxMmpfYXZJMkJOc0lyVUlWelhBbGxEbFpBYw&q=https%3A%2F%2Fwww.instagram.com%2Fhearts2hearts%2F',
                ),
                tooltip: 'Instagram',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.youtube),
                onPressed: () => _launchURL(
                  'https://www.youtube.com/@hearts2hearts.official',
                ),
                tooltip: 'YouTube',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.tiktok),
                onPressed: () => _launchURL(
                  'https://www.youtube.com/redirect?event=channel_description&redir_token=QUFFLUhqbm1sbVlmVm5IRDRYTURQTkJRVzd6c0JLbF8yUXxBQ3Jtc0trLWVPY3gwbEwzRVlYNzdkWkkyeEVIN29mc0Y1VG8tbVNqTjRkU0dDel90al9SZnFRbHVyeW1UMFhudVZGMlRxTHdid2hnRkVmZGhKdXlIeGF5V2MyR3ZDcnFHSkc0ZS1USkhUeWFCMzNPQ2p1ZmNOdw&q=https%3A%2F%2Fwww.tiktok.com%2F%40hearts2hearts',
                ),
                tooltip: 'Tiktok',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
