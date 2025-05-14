import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project_item.dart';
class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Projects")),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectItem(project: projects[index]);
        },
      ),
    );
  }
}
