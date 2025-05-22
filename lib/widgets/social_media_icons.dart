import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.purple),
          onPressed: () => _launchUrl('https://instagram.com/username'),
        ),
        IconButton(
          icon: const Icon(Icons.code, color: Colors.grey),
          onPressed: () => _launchUrl('https://github.com/username'),
        ),
        IconButton(
          icon: const Icon(Icons.business_center, color: Colors.blue),
          onPressed: () => _launchUrl('https://linkedin.com/in/username'),
        ),
      ],
    );
  }
}
