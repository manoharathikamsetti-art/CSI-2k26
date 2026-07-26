import 'dart:convert';

import '../models/complaint.dart';
import '../models/language_option.dart';

class MockDataService {
  static const String _complaintsJson = '''
  [
    {
      "id": "CMP-1001",
      "tokenNumber": "TK-2451",
      "name": "Ananya Rao",
      "department": "Public Works",
      "category": "Road Repair",
      "status": "In Progress",
      "date": "22 Jul 2026",
      "summary": "A damaged road near Ward 8 is affecting school transport and emergency access.",
      "priority": "High",
      "source": "Voice"
    },
    {
      "id": "CMP-1002",
      "tokenNumber": "TK-2452",
      "name": "Suresh Kumar",
      "department": "Water Supply",
      "category": "Water Leakage",
      "status": "Resolved",
      "date": "21 Jul 2026",
      "summary": "Persistent leakage in the pipeline on Main Bazaar Road has been fixed.",
      "priority": "Medium",
      "source": "Text"
    },
    {
      "id": "CMP-1003",
      "tokenNumber": "TK-2453",
      "name": "Meena Devi",
      "department": "Electricity",
      "category": "Streetlight",
      "status": "Pending",
      "date": "20 Jul 2026",
      "summary": "Multiple streetlights are non-functional near the bus stop and community hall.",
      "priority": "Low",
      "source": "Voice"
    }
  ]
  ''';

  static List<LanguageOption> languages() => const [
        LanguageOption(
          code: 'en',
          label: 'English',
          nativeLabel: 'English',
          icon: 'EN',
        ),
        LanguageOption(
          code: 'hi',
          label: 'Hindi',
          nativeLabel: 'हिंदी',
          icon: 'हि',
        ),
        LanguageOption(
          code: 'ta',
          label: 'Tamil',
          nativeLabel: 'தமிழ்',
          icon: 'த',
        ),
        LanguageOption(
          code: 'te',
          label: 'Telugu',
          nativeLabel: 'తెలుగు',
          icon: 'తె',
        ),
      ];

  static List<Complaint> complaints() {
    final decoded = jsonDecode(_complaintsJson) as List<dynamic>;
    return decoded
        .map((item) => Complaint.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
