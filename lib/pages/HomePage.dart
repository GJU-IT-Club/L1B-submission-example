import 'package:flutter/material.dart';
import 'package:test_app/models/Gemuse.dart';
import 'package:test_app/pages/gemuse_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Gemuse> gemuse = [];
  void _addGemuse() {
    showDialog(
      context: context,
      builder: (ctx) {
        String name = "";
        String imageUrl = "";
        String description = "";

        return AlertDialog(
          title: Text("Add Gemuse"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Gemuse Name"),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "ImageURL"),
                onChanged: (value) => imageUrl = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Gemuse Description"),
                onChanged: (value) => description = value,
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  gemuse.add(
                    Gemuse(
                      name: name,
                      imageUrl: imageUrl,
                      description: description,
                    ),
                  );
                });
                Navigator.of(ctx).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gemuse Wiki",
          style: TextStyle(
            fontFamily: "Fuggles",
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          gemuse.isEmpty
              ? Center(child: Text("You can use the + button to add Gemuse"))
              : ListView.builder(
                itemCount: gemuse.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(gemuse[index].imageUrl),
                      ),
                      title: Text(gemuse[index].name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    GemuseDetailPage(gemuse: gemuse[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGemuse,
        child: Icon(Icons.add),
      ),
    );
  }
}
