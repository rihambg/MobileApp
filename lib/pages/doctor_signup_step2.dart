import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  bool _agreeToGuidelines = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF9F8FEF),
        title: const Text(
          'DIABETES APP',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
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
                            decoration: InputDecoration(
                              hintText: 'xx-xx-xx-xx-x',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, 
                                vertical: 14
                              ),
                            ),
                            initialCountryCode: 'US',
                            dropdownIconPosition: IconPosition.trailing,
                            disableLengthCheck: true,
                            showDropdownIcon: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Time of Expertise Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Time Of Expertise',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _experienceController,
                          decoration: _inputDecoration('Enter as YY (exp: 20 Year)'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Experience time is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Professional ID Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Professional ID',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _professionalIdController,
                          decoration: _inputDecoration('Enter as #########'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Professional ID is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),

                    // Supporting Document Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Supporting Document (PDF)*',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _documentController,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Add your document\n(Professional card/certificate of practice or\nfrom the medical association)',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            suffixIcon: const Icon(Icons.file_upload_outlined),
                          ),
                          maxLines: 3,
                          onTap: () {
                            // Implement document picker
                            // This is just a placeholder
                            setState(() {
                              _documentController.text = 'document.pdf';
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Supporting document is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Agree to guidelines checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _agreeToGuidelines,
                            onChanged: (value) {
                              setState(() {
                                _agreeToGuidelines = value ?? false;
                              });
                            },
                            fillColor: MaterialStateProperty.all(Colors.white),
                            checkColor: const Color(0xFF9F8FEF),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Agree to guidelines and policies',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Done Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _agreeToGuidelines
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Account created successfully!')),
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

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      errorStyle: const TextStyle(
        color: Colors.redAccent,
        fontSize: 12,
        height: 1.5,
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