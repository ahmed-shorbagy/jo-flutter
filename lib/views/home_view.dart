import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jo_univ_flutter/core/utils/App_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Academy'),
        backgroundColor: Color(0xFF6A11CB),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore our Key Features',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Get to know about our specializations, courses, and more!',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.school, color: Colors.white),
                title: Text('Apply Now', style: TextStyle(color: Colors.white)),
                onTap: () => GoRouter.of(context).push(AppRouter.kApplyView),
              ),
              ListTile(
                leading: Icon(Icons.book, color: Colors.white),
                title: Text('Courses', style: TextStyle(color: Colors.white)),
                onTap: () => GoRouter.of(context).push(AppRouter.kCoursesView),
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.white),
                title: Text('My Application',
                    style: TextStyle(color: Colors.white)),
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.kApplicationView),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF6A11CB)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Color(0xFF6A11CB)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Color(0xFF6A11CB)),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Set the default selected tab
        onTap: (index) {
          switch (index) {
            case 0:
              GoRouter.of(context).go(AppRouter.kHomeView);
              break;
            case 1:
              break;
            case 2:
              break;
          }
        },
      ),
    );
  }
}
