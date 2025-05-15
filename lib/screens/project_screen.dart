import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project_item.dart';

final List<Project> projects = [
  Project(
    title: "Portfolio Website",
    description: "Website pribadi untuk menampilkan portofolio",
    imageUrl: "assets/portfolio.jpg",
  ),
  Project(
    title: "To-Do List App",
    description: "Aplikasi Flutter untuk mengelola tugas harian",
    imageUrl: "assets/todo.png",
  ),
];

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("My Projects"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: projects.map((p) => ProjectItem(project: p)).toList(),
        ),
      ),
    );
  }
}