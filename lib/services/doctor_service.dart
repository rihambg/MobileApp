import '../models/doctor_info.dart';

class DoctorService {
  static Future<void> submitDoctorInfo(DoctorSignupModel info) async {
    // TODO: Implement backend logic here
    print('Submitted: ${info.phoneNumber}, ${info.experience}, ${info.professionalId}, ${info.documentName}');
  }
}
