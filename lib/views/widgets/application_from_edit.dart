import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jo_univ_flutter/models/application_model.dart';
import 'package:jo_univ_flutter/views/application_status_view.dart';

class ApplicationEditForm extends StatefulWidget {
  final Application existingApplication;

  const ApplicationEditForm({super.key, required this.existingApplication});

  @override
  _ApplicationEditFormState createState() => _ApplicationEditFormState();
}

class _ApplicationEditFormState extends State<ApplicationEditForm> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedDocuments;

  late Application _application;

  @override
  void initState() {
    super.initState();
    // Create a copy of the existing application to modify
    _application = Application(
      id: widget.existingApplication.id,
      userId: widget.existingApplication.userId,
      applicantName: widget.existingApplication.applicantName,
      university: widget.existingApplication.university,
      program: widget.existingApplication.program,
      specialization: widget.existingApplication.specialization,
      status: 'Incomplete',
      submittedAt: DateTime.now(),
      documentsSubmitted: widget.existingApplication.documentsSubmitted,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Application'),
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
                  initialValue: _application.applicantName,
                  onChanged: (value) => _application.applicantName = value,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  labelText: 'University',
                  icon: Icons.school,
                  initialValue: _application.university,
                  onChanged: (value) => _application.university = value,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  labelText: 'Program',
                  icon: Icons.book,
                  initialValue: _application.program,
                  onChanged: (value) => _application.program = value,
                ),
                const SizedBox(height: 10),
                _buildSpecializationField(),
                const SizedBox(height: 10),
                _buildDocumentUploadSection(),
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
      'Complete Your Application',
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
    required String initialValue,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: _buildInputDecoration(labelText: labelText, icon: icon),
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter $labelText' : null,
    );
  }

  Widget _buildSpecializationField() {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFF6A11CB),
      decoration: _buildInputDecoration(
        labelText: 'Specialization',
        icon: Icons.category,
      ),
      value: _application.specialization.isEmpty
          ? null
          : _application.specialization,
      items: const [
        DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
        DropdownMenuItem(value: 'Web Dev', child: Text('Web Development')),
        DropdownMenuItem(value: 'Full Stack', child: Text('Full Stack')),
        DropdownMenuItem(value: 'PHP', child: Text('PHP')),
        DropdownMenuItem(value: 'Angular', child: Text('Angular')),
        DropdownMenuItem(value: 'After Effects', child: Text('After Effects')),
      ],
      onChanged: (value) =>
          setState(() => _application.specialization = value ?? ''),
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
      _application.documentsSubmitted = pickedDocuments != null;
    });
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submitApplication,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Update Application',
        style: TextStyle(color: Color(0xFF6A11CB), fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _submitApplication() async {
    if (!_formKey.currentState!.validate()) return;

    final firestore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final updatedApplication = {
      'id': userId,
      'applicantName': _application.applicantName,
      'university': _application.university,
      'program': _application.program,
      'specialization': _application.specialization,
      'status': 'Complete', // Mark as complete when all fields are filled
      'submittedAt': Timestamp.now(),
      'documentsSubmitted': _selectedDocuments != null,
    };

    await firestore
        .collection('applications')
        .doc(_application.id)
        .update(updatedApplication);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Application updated successfully!')),
    );

    // Navigate back to the previous screen
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

// Modify the existing ApplicationStatusView to add edit functionality
extension ApplicationStatusViewExtension on ApplicationStatusView {
  void showEditApplicationDialog(
      BuildContext context, Application application) {
    if (application.status == 'Incomplete') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ApplicationEditForm(existingApplication: application),
        ),
      );
    }
  }
}
