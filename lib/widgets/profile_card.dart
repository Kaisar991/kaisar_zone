import 'package:flutter/material.dart';
class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/profile.jpg"),
            ),
            SizedBox(height: 10),
            Text(
              "KAISAR",
              style: TextStyle(fontSize: 20, fontWeight:
              FontWeight.bold),
            ),
            Text("Desain Grafis"),
          ],
        ),
      ),
    );
  }
}