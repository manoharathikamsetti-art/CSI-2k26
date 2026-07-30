import 'package:flutter/foundation.dart';

import '../models/generated_letter.dart';

class AppState extends ChangeNotifier {
  String _languageCode = 'te';
  GeneratedLetter? _generatedLetter;
  String _generatedLetterText = '';
  String _savedGeneratedLetterText = '';
  bool _generatedLetterEditing = false;

  String get languageCode => _languageCode;
  GeneratedLetter? get generatedLetter => _generatedLetter;
  String get generatedLetterText => _generatedLetterText;
  String get savedGeneratedLetterText => _savedGeneratedLetterText;
  bool get generatedLetterEditing => _generatedLetterEditing;

  void updateLanguage(String code) {
    _languageCode = code;
    notifyListeners();
  }

  void setGeneratedLetter(GeneratedLetter letter) {
    _generatedLetter = letter;
    _generatedLetterText = letter.fullLetter;
    _savedGeneratedLetterText = letter.fullLetter;
    _generatedLetterEditing = false;
    notifyListeners();
  }

  void updateGeneratedLetterText(String text) {
    _generatedLetterText = text;
    notifyListeners();
  }

  void setGeneratedLetterEditing(bool isEditing) {
    _generatedLetterEditing = isEditing;
    notifyListeners();
  }

  void saveGeneratedLetterText(String text) {
    _generatedLetterText = text;
    _savedGeneratedLetterText = text;
    _generatedLetterEditing = false;
    notifyListeners();
  }
}
