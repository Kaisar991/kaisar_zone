import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  // Function to launch external URLs (social media links)
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // GANTI sesuai path & nama file background kamu
              fit: BoxFit.cover,
            ),
          ),

          // Overlay gradasi ungu ke pink semi-transparan
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade400.withOpacity(0.8),
                    Colors.pink.shade200.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/profile.jpg', // GANTI dengan foto profil kamu jika ada
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Your Name', // GANTI dengan nama kamu
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Bagian "Tentang Saya"
                const Text(
                  'Tentang Saya',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Deskripsikan sedikit tentang dirimu di sini. Misalnya latar belakang pendidikan, pengalaman kerja singkat, hobi, atau passion kamu dalam dunia pemrograman.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),

                // Bagian "Skills"
                const Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    Chip(label: Text('Flutter'), backgroundColor: Colors.white70),
                    Chip(label: Text('Dart'), backgroundColor: Colors.white70),
                    Chip(label: Text('Firebase'), backgroundColor: Colors.white70),
                    Chip(label: Text('UI/UX'), backgroundColor: Colors.white70),
                  ],
                ),
                const SizedBox(height: 24),

                // Bagian "Kontak"
                const Text(
                  'Kontak',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () => _launchURL('https://instagram.com/your_username'),
                      tooltip: 'Instagram',
                    ),
                    IconButton(
                      icon: const Icon(Icons.work, color: Colors.white),
                      onPressed: () => _launchURL('https://linkedin.com/in/your_username'),
                      tooltip: 'LinkedIn',
                    ),
                    IconButton(
                      icon: const Icon(Icons.code, color: Colors.white),
                      onPressed: () => _launchURL('https://github.com/your_username'),
                      tooltip: 'GitHub',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}