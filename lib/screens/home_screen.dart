import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import 'project_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 3,
        centerTitle: true,
        title: const Text(
          'Kaisar Zone',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.white),
          onSelected: (value) {},
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 'Instagram',
              child: ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.purple),
                title: Text('Instagram'),
              ),
            ),
            const PopupMenuItem(
              value: 'GitHub',
              child: ListTile(
                leading: Icon(Icons.code, color: Colors.grey),
                title: Text('GitHub'),
              ),
            ),
            const PopupMenuItem(
              value: 'LinkedIn',
              child: ListTile(
                leading: Icon(Icons.business_center, color: Colors.blue),
                title: Text('LinkedIn'),
              ),
            ),
          ],
        ),
      ),

      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0), // transparan tapi tetap bisa blur
            ),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.withOpacity(0.6),
                  Colors.pink.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 120.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileCard(),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProjectScreen()),
                        );
                      },
                      child: const Text(
                        'View Projects',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
