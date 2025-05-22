import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/project.dart';

class ProjectItem extends StatefulWidget {
  final Project project;

  const ProjectItem({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isLoved = false;

  @override
  void initState() {
    super.initState();
    loadLoveStatus();
  }

  Future<void> loadLoveStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'loved_${widget.project.title}';
    setState(() {
      isLoved = prefs.getBool(key) ?? false;
    });
  }

  Future<void> toggleLoveStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'loved_${widget.project.title}';
    setState(() {
      isLoved = !isLoved;
    });
    await prefs.setBool(key, isLoved);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              widget.project.imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.title,
                  style: const TextStyle(
                    fontFamily: 'voyage',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.project.description,
                  style: const TextStyle(
                    fontFamily: 'ghost',
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tahun: ${widget.project.year}',
                      style: const TextStyle(
                        fontFamily: 'ghost',
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: toggleLoveStatus,
                          child: Icon(
                            isLoved
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: isLoved ? Colors.redAccent : Colors.white54,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.project.rating.toString(),
                          style: const TextStyle(
                            fontFamily: 'ghost',
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
