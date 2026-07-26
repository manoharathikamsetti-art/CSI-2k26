import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  String _languageCode = 'en';
  String _selectedComplaintType = 'Road Repair';

  String get languageCode => _languageCode;
  String get selectedComplaintType => _selectedComplaintType;

  void updateLanguage(String code) {
    _languageCode = code;
    notifyListeners();
  }

  void updateComplaintType(String complaintType) {
    _selectedComplaintType = complaintType;
    notifyListeners();
  }
}
