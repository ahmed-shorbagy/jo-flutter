import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../models/application_model.dart';

class ApplicationFormView extends StatefulWidget {
  const ApplicationFormView({super.key});

  @override
  _ApplicationFormViewState createState() => _ApplicationFormViewState();
}

class _ApplicationFormViewState extends State<ApplicationFormView> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedDocuments;
  String applicationStatus = "Fetching...";

  Application application = Application(
    id: '',
    applicantName: '',
    university: '',
    program: '',
    specialization: '',
    status: 'Pending',
    submittedAt: DateTime.now(),
    documentsSubmitted: false,
  );

  @override
  void initState() {
    super.initState();
    _fetchApplicationStatus();
  }

  Future<void> _fetchApplicationStatus() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('applications')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (doc.exists) {
        setState(() {
          applicationStatus = doc.data()?['status'] ?? 'No status available';
        });
      } else {
        setState(() {
          applicationStatus = "No application found";
        });
      }
    } catch (e) {
      setState(() {
        applicationStatus = "Error fetching status";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form'),
        backgroundColor: const Color(0xFF6A11CB),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildTextField(
                  labelText: 'Name',
                  icon: Icons.person,
                  initialValue: application.applicantName,
                  onChanged: (value) => application.applicantName = value,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  labelText: 'University',
                  icon: Icons.school,
                  initialValue: application.university,
                  onChanged: (value) => application.university = value,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your university'
                      : null,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Program',
                  icon: Icons.book,
                  initialValue: application.program,
                  onChanged: (value) => application.program = value,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your program'
                      : null,
                ),
                const SizedBox(height: 10),
                _buildSpecializationField(),
                const SizedBox(height: 10),
                _buildDocumentUploadSection(),
                const SizedBox(height: 20),
                _buildStatusSection(),
                const SizedBox(height: 30),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'Application Form',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    required String? initialValue,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: _buildInputDecoration(labelText: labelText, icon: icon),
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildSpecializationField() {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFF6A11CB),
      decoration: _buildInputDecoration(
        labelText: 'Specialization',
        icon: Icons.category,
      ),
      value: application.specialization.isEmpty
          ? null
          : application.specialization,
      items: const [
        DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
        DropdownMenuItem(value: 'Web Dev', child: Text('Web Development')),
        DropdownMenuItem(value: 'Full Stack', child: Text('Full Stack')),
        DropdownMenuItem(value: 'PHP', child: Text('PHP')),
        DropdownMenuItem(value: 'Angular', child: Text('Angular')),
        DropdownMenuItem(value: 'After Effects', child: Text('After Effects')),
      ],
      onChanged: (value) =>
          setState(() => application.specialization = value ?? ''),
      validator: (value) => value == null || value.isEmpty
          ? 'Please select a specialization'
          : null,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildDocumentUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Documents',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickDocuments,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Select Transcripts/Certificates/ID'),
        ),
        if (_selectedDocuments != null)
          ListView.builder(
            shrinkWrap: true,
            itemCount: _selectedDocuments!.length,
            itemBuilder: (context, index) {
              return Text(
                _selectedDocuments![index].name,
                style: const TextStyle(color: Colors.white),
              );
            },
          ),
      ],
    );
  }

  Future<void> _pickDocuments() async {
    final pickedDocuments = await _picker.pickMultiImage();
    setState(() {
      _selectedDocuments = pickedDocuments;
      application.documentsSubmitted = pickedDocuments != null;
    });
  }

  Widget _buildStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Application Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          applicationStatus,
          style: const TextStyle(color: Colors.yellowAccent, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => _submitApplication(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Submit Application',
        style: TextStyle(color: Color(0xFF6A11CB), fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _submitApplication(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final firestore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final newApplication = {
      'id': userId,
      'applicantName': application.applicantName,
      'university': application.university,
      'program': application.program,
      'specialization': application.specialization,
      'status': application.status,
      'submittedAt': Timestamp.now(),
      'documentsSubmitted': _selectedDocuments != null,
    };

    await firestore.collection('applications').doc(userId).set(newApplication);
    GoRouter.of(context).pop();
  }

  InputDecoration _buildInputDecoration({
    required String labelText,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white70),
      prefixIcon: Icon(icon, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white30),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
