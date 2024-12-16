import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6A11CB),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSectionHeader('Available Courses'),
            const SizedBox(height: 16),
            _buildCoursesList(),
            const SizedBox(height: 24),
            _buildSectionHeader('Application Process'),
            const SizedBox(height: 16),
            _buildApplicationSteps(),
            const SizedBox(height: 24),
            _buildSectionHeader('Frequently Asked Questions'),
            const SizedBox(height: 16),
            _buildFAQSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildCoursesList() {
    final courses = [
      Course(
        name: 'Flutter Development',
        description:
            'Comprehensive mobile app development using Flutter and Dart',
        duration: '6 Months',
        difficulty: 'Intermediate',
        icon: Icons.phone_android,
      ),
      Course(
        name: 'Web Development Bootcamp',
        description: 'Full-stack web development with modern technologies',
        duration: '9 Months',
        difficulty: 'Advanced',
        icon: Icons.web,
      ),
      Course(
        name: 'Full Stack Development',
        description:
            'End-to-end software development covering frontend and backend',
        duration: '12 Months',
        difficulty: 'Expert',
        icon: Icons.layers,
      ),
      Course(
        name: 'Data Science',
        description: 'Advanced data analysis and machine learning techniques',
        duration: '8 Months',
        difficulty: 'Advanced',
        icon: Icons.analytics,
      ),
    ];

    return Column(
      children: courses.map((course) => _buildCourseCard(course)).toList(),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Card(
      color: const Color.fromARGB(255, 119, 13, 233),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                course.icon,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildCourseDetailChip(
                        Icons.timer_outlined,
                        course.duration,
                      ),
                      const SizedBox(width: 8),
                      _buildCourseDetailChip(
                        Icons.signal_cellular_alt,
                        course.difficulty,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseDetailChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationSteps() {
    final steps = [
      'Research Courses: Explore available courses and select your preferred program',
      'Prepare Documents: Gather all required academic and personal documents',
      'Online Application: Fill out the application form with accurate information',
      'Upload Documents: Scan and upload all necessary supporting documents',
      'Application Review: Wait for the admissions team to review your application',
      'Interview (if required): Participate in an interview or assessment',
      'Admission Decision: Receive notification of acceptance or further steps',
    ];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Application Process Steps',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A11CB),
              ),
            ),
            const SizedBox(height: 16),
            ...steps.map((step) => _buildApplicationStep(step)),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationStep(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF6A11CB),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              step,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection() {
    final faqs = [
      {
        'question': 'What are the admission requirements?',
        'answer':
            'Requirements vary by course. Generally, you need a high school diploma or equivalent, and some courses may require specific prerequisites.',
      },
      {
        'question': 'How long does the application process take?',
        'answer':
            'The typical application review process takes 2-4 weeks. Complex applications might take longer depending on the course and additional requirements.',
      },
      {
        'question': 'Are there any scholarships available?',
        'answer':
            'Yes, we offer various scholarships based on academic merit, financial need, and specific course achievements. Check our scholarship page for details.',
      },
      {
        'question': 'Can I apply for multiple courses?',
        'answer':
            'Absolutely! You can apply to multiple courses. Each application will be reviewed separately.',
      },
    ];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      color: Colors.white,
      child: ExpansionPanelList.radio(
        children: faqs
            .map(
              (faq) => ExpansionPanelRadio(
                value: faq['question']!,
                headerBuilder: (context, isExpanded) => ListTile(
                  title: Text(
                    faq['question']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A11CB),
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faq['answer']!,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// Course Model
class Course {
  final String name;
  final String description;
  final String duration;
  final String difficulty;
  final IconData icon;

  Course({
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.icon,
  });
}
