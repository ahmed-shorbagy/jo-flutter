import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jo_univ_flutter/core/utils/logger.dart';
import 'package:jo_univ_flutter/models/application_model.dart';
import 'package:jo_univ_flutter/views/widgets/application_from_edit.dart';

class ApplicationStatusView extends StatelessWidget {
  const ApplicationStatusView({super.key});

  Stream<List<Application>> fetchUserApplications(String userId) {
    final firestore = FirebaseFirestore.instance;
    return firestore
        .collection('applications')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Application.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Application Status',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<List<Application>>(
            stream: fetchUserApplications(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }

              if (snapshot.hasError) {
                Logger.error(snapshot.error.toString());
                return _buildErrorWidget(snapshot.error);
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _buildEmptyStateWidget();
              }

              return _buildApplicationsList(snapshot.data!);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(Object? error) {
    Logger.error(error.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 60,
          ),
          const SizedBox(height: 16),
          const Text(
            'Error fetching applications',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF6A11CB),
            ),
            onPressed: () {
              // Implement retry logic if needed
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            color: Colors.white,
            size: 60,
          ),
          SizedBox(height: 16),
          Text(
            'No Applications Found',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You haven\'t submitted any applications yet.',
            style: TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationsList(List<Application> applications) {
    return ListView.builder(
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications[index];
        return _buildApplicationCard(application, context);
      },
    );
  }

  Widget _buildApplicationCard(Application application, BuildContext context) {
    final statusColors = {
      "Approved": Colors.green,
      "Pending": Colors.orange,
      "Incomplete": Colors.red,
    };

    final statusColor = statusColors[application.status] ?? Colors.grey;

    return GestureDetector(
      onTap: () {
        if (application.status == 'Incomplete') {
          showEditApplicationDialog(context, application);
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        shadowColor: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildApplicationHeader(application, statusColor),
              const SizedBox(height: 12),
              _buildApplicationDetails(application),
              const SizedBox(height: 12),
              _buildStatusAndDocumentsRow(application, statusColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplicationHeader(Application application, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            application.applicantName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            application.status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationDetails(Application application) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          icon: Icons.school_outlined,
          text: '${application.university} - ${application.program}',
        ),
        const SizedBox(height: 8),
        _buildDetailRow(
          icon: Icons.color_lens_outlined,
          text: application.specialization,
        ),
        const SizedBox(height: 8),
        _buildDetailRow(
          icon: Icons.calendar_today_outlined,
          text: application.submittedAt.toShortDate(),
        ),
      ],
    );
  }

  Widget _buildDetailRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusAndDocumentsRow(
      Application application, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              application.documentsSubmitted
                  ? Icons.check_circle_outline
                  : Icons.warning_amber_outlined,
              color: Colors.green,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Documents Submitted',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
        Text(
          'Submitted: ${application.submittedAt.toShortDate()}',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

extension DateTimeExtension on DateTime {
  String toShortDate() {
    return "$day/$month/$year";
  }
}
