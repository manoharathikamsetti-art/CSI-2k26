import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/constants/app_config.dart';
import '../l10n/app_localizations.dart';
import '../models/generated_letter.dart';

enum _DepartmentType {
  revenue,
  municipal,
  panchayat,
  police,
  socialWelfare,
  civilSupplies,
  education,
  agriculture,
  health,
  electricity,
  waterResources,
  roadsAndBuildings,
}

class N8nVoiceComplaintService {
  const N8nVoiceComplaintService();

  Future<GeneratedLetter> submitComplaint({
    required String citizenName,
    required String audioFilePath,
    required AppLocalizations l10n,
  }) async {
    final webhookUrl = AppConfig.n8nVoiceComplaintWebhookUrl;
    if (webhookUrl.trim().isEmpty) {
      throw StateError('Webhook URL is not configured.');
    }

    final request = http.MultipartRequest('POST', Uri.parse(webhookUrl))
      ..fields['citizenName'] = citizenName.trim()
      ..fields['languageCode'] = l10n.locale.languageCode
      ..files.add(await http.MultipartFile.fromPath('audio', audioFilePath));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError('Request failed with status ${response.statusCode}.');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid response format.');
    }

    final department = _stringValue(decoded['department']);
    final category = _stringValue(decoded['category']);
    final subject = _stringValue(decoded['subject']);
    final transcribedText = _stringValue(decoded['transcribedText']);
    final letter = _stringValue(decoded['letter']);

    return GeneratedLetter(
      citizenName: citizenName.trim(),
      recommendedDepartment: department,
      departmentIcon: _departmentIconFor(department, category),
      complaintCategory: category,
      transcribedText: transcribedText,
      subject: subject,
      body: transcribedText,
      fullLetter: letter,
    );
  }

  String _stringValue(dynamic value) => value?.toString().trim() ?? '';

  IconData _departmentIconFor(String department, String category) {
    final normalized = '${department.toLowerCase()} ${category.toLowerCase()}';

    if (_containsAny(normalized, ['road', 'bridge', 'street', 'highway', 'building'])) {
      return Icons.route_rounded;
    }
    if (_containsAny(normalized, ['water', 'drain', 'pipeline', 'canal', 'irrigation'])) {
      return Icons.water_drop_rounded;
    }
    if (_containsAny(normalized, ['electric', 'power', 'light', 'transformer'])) {
      return Icons.flash_on_rounded;
    }
    if (_containsAny(normalized, ['police', 'safety', 'crime', 'harassment'])) {
      return Icons.local_police_rounded;
    }
    if (_containsAny(normalized, ['welfare', 'pension', 'widow', 'disabled', 'senior'])) {
      return Icons.volunteer_activism_rounded;
    }
    if (_containsAny(normalized, ['ration', 'supply', 'fair price', 'civil supplies'])) {
      return Icons.store_rounded;
    }
    if (_containsAny(normalized, ['school', 'college', 'education', 'student', 'teacher'])) {
      return Icons.school_rounded;
    }
    if (_containsAny(normalized, ['agriculture', 'farmer', 'crop', 'fertilizer', 'seed'])) {
      return Icons.agriculture_rounded;
    }
    if (_containsAny(normalized, ['health', 'hospital', 'doctor', 'medicine', 'ambulance'])) {
      return Icons.local_hospital_rounded;
    }
    if (_containsAny(normalized, ['municipal', 'sanitation', 'garbage', 'sewage', 'drainage'])) {
      return Icons.location_city_rounded;
    }
    if (_containsAny(normalized, ['panchayat', 'village', 'gram', 'ward'])) {
      return Icons.holiday_village_rounded;
    }

    return Icons.account_balance_rounded;
  }

  bool _containsAny(String value, List<String> keywords) {
    return keywords.any(value.contains);
  }
}
