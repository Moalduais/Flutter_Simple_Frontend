import 'package:flutter/material.dart';

void main() {
  runApp(const StorageLabApp());
}

class StorageLabApp extends StatelessWidget {
  const StorageLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        useMaterial3: false, 
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data based on the PDF Assignment 2 requirements
  final List<Map<String, String>> storageTasks = const [
    {"name": "Bulbasaur", "type": "dinasor", "icon": "🌱"},
    {"name": "Ivysaur", "type": "dinasor", "icon": "🌿"},
    {"name": "Venusaur", "type": "dinasor", "icon": "🌳"},
    {"name": "Charmander", "type": "dinasor", "icon": "🔥"},
    {"name": "Charmeleon", "type": "dinasor", "icon": "🔥"},
    {"name": "Charizard", "type": "dinasor", "icon": "X"},
    {"name": "Masazaur", "type": "dinasor", "icon": "💾"},
    {"name": "Simple", "type": "dinasor", "icon": "🛠️"},
    {"name": "Simple2", "type": "dinasor", "icon": "🔗"},
    {"name": "Simple3", "type": "Performance", "icon": "⚡"},
    {"name": "Simple4", "type": "Redundancy", "icon": "👯"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Title reflects the Assignment name from the document [cite: 6]
        title: const Text(
          "Admin & Maintenance Lab 2",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 4,
        leading: const Icon(Icons.menu, color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the Failure Test required in the assignment [cite: 40]
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Testing Mirrored Volume Failure...")),
          );
        },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: storageTasks.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    storageTasks[index]['icon']!,
                    style: const TextStyle(fontSize: 45),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    storageTasks[index]['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    storageTasks[index]['type']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}