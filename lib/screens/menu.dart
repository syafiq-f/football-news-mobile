import 'package:flutter/material.dart';
import 'package:football_news/widgets/left_drawer.dart';
import 'package:football_news/widgets/news_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Syafiq Faqih";
  final String npm = "2406439715";
  final String kelas = "C";

  final List<Map<String, dynamic>> items = [
    {"name": "See Football News", "icon": Icons.newspaper},
    {"name": "Add News", "icon": Icons.add},
    {"name": "Logout", "icon": Icons.logout},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football News',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ====== Row InfoCard (NPM, Name, Class) ======
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: "NPM", content: npm),
                InfoCard(title: "Name", content: nama),
                InfoCard(title: "Class", content: kelas),
              ],
            ),

            const SizedBox(height: 16.0),

            const Text(
              'Selamat datang di Football News',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),

            const SizedBox(height: 20),

            // ====== Grid Button Menu ======
            GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items
                  .map((item) => NewsCard(item["name"], item["icon"]))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
