import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import '../screens/project_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showSocialMediaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Temukan Saya di"),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.purple),
              onPressed: () => _launchURL('https://instagram.com/your_username'),
              tooltip: 'Instagram',
            ),
            IconButton(
              icon: Icon(Icons.work, color: Colors.purple),
              onPressed: () => _launchURL('https://linkedin.com/in/your_username'),
              tooltip: 'LinkedIn',
            ),
            IconButton(
              icon: Icon(Icons.code, color: Colors.purple),
              onPressed: () => _launchURL('https://github.com/your_username'),
              tooltip: 'GitHub',
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text("Tutup"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Portfolio"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert), // Ikon garis tiga ke bawah
            tooltip: 'Media Sosial',
            onPressed: () => _showSocialMediaDialog(context),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.pink.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 300,
                child: ProfileCard(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade700,
                ),
                child: Text("View Projects"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
