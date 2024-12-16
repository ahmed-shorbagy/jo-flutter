import 'package:cloud_firestore/cloud_firestore.dart';

class Application {
  final String id;
  String applicantName;
  String university;
  String program;
  String specialization;
  final String status;
  DateTime submittedAt;
  bool documentsSubmitted;

  Application({
    required this.id,
    required this.applicantName,
    required this.university,
    required this.program,
    required this.specialization,
    required this.status,
    required this.submittedAt,
    required this.documentsSubmitted,
  });

  factory Application.fromFirestore(Map<String, dynamic> data, String id) {
    return Application(
      id: id,
      applicantName: data['applicantName'] ?? '',
      university: data['university'] ?? '',
      program: data['program'] ?? '',
      specialization: data['specialization'] ?? '',
      status: data['status'] ?? 'Pending',
      submittedAt:
          (data['submittedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      documentsSubmitted: data['documentsSubmitted'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'applicantName': applicantName,
      'university': university,
      'program': program,
      'specialization': specialization,
      'status': status,
      'submittedAt': submittedAt,
      'documentsSubmitted': documentsSubmitted,
    };
  }

  Application copyWith({
    String? id,
    String? applicantName,
    String? university,
    String? program,
    String? specialization,
    String? status,
    DateTime? submittedAt,
    bool? documentsSubmitted,
  }) {
    return Application(
      id: id ?? this.id,
      applicantName: applicantName ?? this.applicantName,
      university: university ?? this.university,
      program: program ?? this.program,
      specialization: specialization ?? this.specialization,
      status: status ?? this.status,
      submittedAt: submittedAt ?? this.submittedAt,
      documentsSubmitted: documentsSubmitted ?? this.documentsSubmitted,
    );
  }
}
