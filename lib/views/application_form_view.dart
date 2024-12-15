import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For file upload

class ApplicationFormView extends StatefulWidget {
  const ApplicationFormView({super.key});

  @override
  _ApplicationFormViewState createState() => _ApplicationFormViewState();
}

class _ApplicationFormViewState extends State<ApplicationFormView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedDocuments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Form'),
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Application Form',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                _buildSpecializationField(),
                SizedBox(height: 20),
                _buildEducationField(),
                SizedBox(height: 20),
                _buildDocumentUploadSection(),
                SizedBox(height: 30),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecializationField() {
    return DropdownButtonFormField<String>(
      // controller: specializationController,
      decoration: _buildInputDecoration(
        labelText: 'Select Specialization',
        icon: Icons.category,
      ),
      items: [
        DropdownMenuItem(value: 'flutter', child: Text('Flutter')),
        DropdownMenuItem(value: 'web dev', child: Text('Web Development')),
        DropdownMenuItem(value: 'full stack', child: Text('Full Stack')),
        DropdownMenuItem(value: 'PHP', child: Text('PHP')),
        DropdownMenuItem(value: 'angular', child: Text('Angular')),
        DropdownMenuItem(value: 'after effects', child: Text('After Effects')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a specialization';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          specializationController.text = value!;
        });
      },
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildEducationField() {
    return TextFormField(
      controller: educationController,
      decoration: _buildInputDecoration(
        labelText: 'Previous Education',
        icon: Icons.school,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your previous education details';
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildDocumentUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Documents',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickDocuments,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Select Transcripts/Certificates',
            style: TextStyle(color: Colors.white),
          ),
        ),
        if (_selectedDocuments != null)
          ListView.builder(
            shrinkWrap: true,
            itemCount: _selectedDocuments!.length,
            itemBuilder: (context, index) {
              return Text(
                _selectedDocuments![index].name,
                style: TextStyle(color: Colors.white),
              );
            },
          ),
      ],
    );
  }

  void _pickDocuments() async {
    final pickedDocuments = await _picker.pickMultiImage();
    setState(() {
      _selectedDocuments = pickedDocuments;
    });
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Submit application data
          print("Specialization: ${specializationController.text}");
          print("Previous Education: ${educationController.text}");
          if (_selectedDocuments != null) {
            for (var doc in _selectedDocuments!) {
              print("Document: ${doc.name}");
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Submit Application',
        style: TextStyle(color: Color(0xFF6A11CB), fontWeight: FontWeight.bold),
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      {required String labelText, required IconData icon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white70),
      prefixIcon: Icon(icon, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white30),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
