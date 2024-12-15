import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jo_univ_flutter/core/utils/App_router.dart';

class ApplicationGuidelinesView extends StatelessWidget {
  const ApplicationGuidelinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines and Instructions'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Application Process Guidelines',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              _buildStep('Step 1: Choose Your Specialization',
                  'Select the specialization that aligns with your career goals.'),
              _buildStep('Step 2: Fill Out Personal Information',
                  'Complete all required fields, including your previous education and other details.'),
              _buildStep('Step 3: Upload Documents',
                  'Ensure that your transcripts, certificates, and ID are in the correct format (PDF, JPEG, etc.).'),
              SizedBox(height: 30),
              Text(
                'FAQs',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              _buildFaq('What if I don’t have a transcript?',
                  'Contact our support team for assistance.'),
              _buildFaq('Can I upload documents later?',
                  'No, all documents must be submitted at the time of application.'),
              _buildFaq('How should I prepare my documents?',
                  'Ensure they are legible and clear, in the specified formats.'),
              SizedBox(height: 30),
              Text(
                'Tips for a Successful Application',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              _buildTip('Double-check your entries before submitting.'),
              _buildTip('Ensure that your email address is valid and active.'),
              _buildTip(
                  'Upload documents in the specified formats (PDF, JPEG).'),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => GoRouter.of(context).go(AppRouter.kHomeView),
                child: Text(
                  'Back to Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFaq(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
        SizedBox(height: 5),
        Text(
          answer,
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        '• $tip',
        style: TextStyle(fontSize: 14, color: Colors.white70),
      ),
    );
  }
}
