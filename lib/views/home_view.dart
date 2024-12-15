import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Academy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Features',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Apply Now'),
              onTap: () => Navigator.pushNamed(context, '/apply'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Courses'),
              onTap: () => Navigator.pushNamed(context, '/courses'),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('My Application'),
              onTap: () => Navigator.pushNamed(context, '/application'),
            ),
          ],
        ),
      ),
    );
  }
}
