import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? selectedSkill;

  final Map<String, String> skillDescriptions = {
    'Abyssal Command': 'Skill ini mengisyaratkan kendali yang dalam dan mengerikan atas inti kegelapan itu sendiri...',
    'Absolute Void': 'Skill ini memungkinkan pengguna menciptakan zona ketiadaan mutlak...',
    'Umbral Tempest': 'Skill ini melepaskan badai energi bayangan yang mengacaukan musuh...',
    'Nightbane Toxin': 'Skill ini melibatkan racun bayangan yang mematikan dan sulit dideteksi...',
    'Soul Scythe': 'Sabit energi gelap untuk mencuri atau merusak jiwa lawan...',
  };

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'ABOUT BILLIE',
          style: TextStyle(
            fontFamily: 'voyage',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.instagram, size: 18, color: Colors.white),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30), // Lebih rapat
            onPressed: () => _launchURL('https://instagram.com/your_username'),
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.linkedin, size: 18, color: Colors.white),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30),
            onPressed: () => _launchURL('https://linkedin.com/in/your_username'),
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.github, size: 18, color: Colors.white),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30),
            onPressed: () => _launchURL('https://github.com/your_username'),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background utama
          Positioned.fill(
            child: Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay hijau-hitam
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900.withOpacity(0.85),
                    Colors.black.withOpacity(0.85),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Gambar tambahan kanan bawah
          Positioned(
            bottom: 0,
            right: 0,
            child: IgnorePointer(
              ignoring: true,
              child: Image.asset(
                'assets/green.png',
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.contain,
                color: Colors.white.withOpacity(1.0),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          // Konten utama
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, kToolbarHeight + 16, 16, 100),
              child: _buildProfileContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/mine.jpg'),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'BILLIE EILISH',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Tentang Saya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Billie Eilish (lahir 2001) memulai kariernya dengan mengunggah lagu "Ocean Eyes" di SoundCloud pada tahun 2015, yang menjadi viral.Bersama kakaknya, Finneas, ia merilis debut EP Dont Smile at Me 2017 yang sukses. Album debutnya, When We All Fall Asleep, Where Do We Go? (2019), menghasilkan hit "Bad Guy" dan meraih banyak penghargaan Grammy. Ia juga menulis lagu tema James Bond, "No Time to Die" (2020), yang memenangkan Oscar. Album keduanya, Happier Than Ever (2021), lebih personal. Pada tahun 2023, lagunya untuk film Barbie, "What Was I Made For?", kembali meraih sukses besar. Album ketiganya, Hit Me Hard and Soft, dirilis pada tahun 2024. Billie dikenal dengan gaya musik dan persona yang unik serta pengaruhnya yang besar di kalangan generasi muda.',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 24),
        const Text(
          'Skills',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skillDescriptions.keys.map((skill) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade100,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  selectedSkill = selectedSkill == skill ? null : skill;
                });
              },
              child: Text(skill),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            final offsetAnim = Tween<Offset>(
              begin: const Offset(0.0, 0.2),
              end: Offset.zero,
            ).animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(position: offsetAnim, child: child),
            );
          },
          child: selectedSkill != null
              ? Container(
            key: ValueKey(selectedSkill),
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.greenAccent),
            ),
            child: Text(
              skillDescriptions[selectedSkill]!,
              style: const TextStyle(color: Colors.white),
            ),
          )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
