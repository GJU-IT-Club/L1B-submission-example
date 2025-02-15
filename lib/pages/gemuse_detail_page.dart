import 'package:flutter/material.dart';
import 'package:test_app/models/Gemuse.dart';

class GemuseDetailPage extends StatelessWidget {
  final Gemuse gemuse;
  const GemuseDetailPage({super.key, required this.gemuse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          gemuse.name,
          style: TextStyle(
            fontFamily: "Fuggles",
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(gemuse.imageUrl),
            SizedBox(height: 16),
            Text(gemuse.description),
          ],
        ),
      ),
    );
  }
}
