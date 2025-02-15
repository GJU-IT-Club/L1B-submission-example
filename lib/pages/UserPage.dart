import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 20),
            Text("Ahmad", style: GoogleFonts.elMessiri(fontSize: 32)),
            Text("der.kartoffel@gju.edu.jo", style: GoogleFonts.elMessiri(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
