import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jo_univ_flutter/core/utils/App_router.dart';

class ApplicationStatusView extends StatelessWidget {
  const ApplicationStatusView({super.key});

  Future<String> fetchApplicationStatus() async {
    // Mock API call
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return "Pending Review"; // Mock status
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Status'),
        backgroundColor: Color(0xFF6A11CB),
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
          child: FutureBuilder<String>(
            future: fetchApplicationStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error fetching status'));
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Application Status',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Status: ${snapshot.data}',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () =>
                          GoRouter.of(context).go(AppRouter.kHomeView),
                      child: Text(
                        'Back to Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
