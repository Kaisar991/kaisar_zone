import 'package:flutter/material.dart';
import '../models/project.dart';
class ProjectItem extends StatelessWidget {
  final Project project;
  ProjectItem({required this.project});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(project.imageUrl, width: 50, height:
        50),
        title: Text(project.title),
        subtitle: Text(project.description),
      ),
    );
  }
}
