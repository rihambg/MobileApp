import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:file_picker/file_picker.dart';

import '../models/doctor_info.dart';
import '../widgets/input_decorations.dart';
import '../services/doctor_service.dart';

class DoctorFinalStepScreen extends StatefulWidget {
  const DoctorFinalStepScreen({super.key});

  @override
  State<DoctorFinalStepScreen> createState() => _DoctorFinalStepScreenState();
}

class _DoctorFinalStepScreenState extends State<DoctorFinalStepScreen> {
  final _formKey = GlobalKey<FormState>();
  final _experienceController = TextEditingController();
  final _professionalIdController = TextEditingController();
  final _documentController = TextEditingController();
  String _phoneNumber = '';
  bool _agreeToGuidelines = false;

  // Store document path for upload
  String? _documentPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9F8FEF),
              Color(0xFF9F8FEF),
              Color(0xFFB8A5F2),
              Color(0x00000000),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Last Step',
                      style: GoogleFonts.jockeyOne(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Add these information as the last step\nto complete your account',
                      style: GoogleFonts.jockeyOne(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Phone Number Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IntlPhoneField(
                            decoration: buildInputDecoration('xx-xx-xx-xx-x'),
                            initialCountryCode: 'US',
                            dropdownIconPosition: IconPosition.trailing,
                            disableLengthCheck: true,
                            showDropdownIcon: true,
                            onChanged: (phone) {
                              _phoneNumber = phone.completeNumber;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Time of Expertise Field
                    buildLabeledTextField(
                      label: 'Time Of Expertise',
                      controller: _experienceController,
                      hint: 'Enter as YY (exp: 20 Year)',
                      keyboardType: TextInputType.number,
                      validatorMsg: 'Experience time is required',
                    ),
                    const SizedBox(height: 18),

                    // Professional ID Field
                    buildLabeledTextField(
                      label: 'Professional ID',
                      controller: _professionalIdController,
                      hint: 'Enter as #########',
                      validatorMsg: 'Professional ID is required',
                    ),
                    const SizedBox(height: 18),

                    // Supporting Document Field with File Picker
                    buildLabeledTextField(
                      label: 'Supporting Document (PDF)*',
                      controller: _documentController,
                      hint:
                          'Add your document\n(Professional card/certificate of practice or\nfrom the medical association)',
                      readOnly: true,
                      maxLines: 3,
                      icon: Icons.file_upload_outlined,
                      onTap: () async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null && result.files.single.path != null) {
    print("Selected File Path: ${result.files.single.path}");
    setState(() {
      _documentController.text = result.files.single.name;
      _documentPath = result.files.single.path;
    });
  } else {
    print("File picking canceled");
  }
},

                      validatorMsg: 'Supporting document is required',
                    ),
                    const SizedBox(height: 24),

                    // Agreement Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeToGuidelines,
                          onChanged: (value) {
                            setState(() {
                              _agreeToGuidelines = value ?? false;
                            });
                          },
                          fillColor: MaterialStateProperty.all(Colors.white),
                          checkColor: const Color(0xFF9F8FEF),
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Agree to guidelines and policies',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _agreeToGuidelines
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  final doctorInfo = DoctorSignupModel(
                                    phoneNumber: _phoneNumber,
                                    experience: _experienceController.text,
                                    professionalId: _professionalIdController.text,
                                    documentName: _documentController.text,
                                    // _documentPath can be used for file upload to backend
                                  );
                                  DoctorService.submitDoctorInfo(doctorInfo);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Account created successfully!'),
                                    ),
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _experienceController.dispose();
    _professionalIdController.dispose();
    _documentController.dispose();
    super.dispose();
  }
}

Widget buildLabeledTextField({
  required String label,
  required TextEditingController controller,
  String? hint,
  TextInputType? keyboardType,
  int maxLines = 1,
  bool readOnly = false,
  IconData? icon,
  String? validatorMsg,
  VoidCallback? onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 14),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        decoration: buildInputDecoration(hint ?? '', icon: icon),
        keyboardType: keyboardType,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMsg ?? 'Field is required';
          }
          return null;
        },
      ),
    ],
  );
}
