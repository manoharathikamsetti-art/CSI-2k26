import 'package:flutter/material.dart';

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

class GrievanceLetterService {
  static GeneratedLetter generateLetter({
    required String citizenName,
    required String complaintText,
    required AppLocalizations l10n,
  }) {
    final normalizedComplaint = complaintText.trim();
    final recommendation = _recommendationFor(normalizedComplaint, l10n);
    final subject = _subjectFor(recommendation.type, l10n);
    final body = _bodyFor(normalizedComplaint, recommendation.categoryLabel, l10n);
    final fullLetter = [
      l10n.toLabel,
      '',
      l10n.districtCollectorLabel,
      l10n.districtCollectorateLabel,
      '',
      '${l10n.subjectLabel}: $subject',
      '',
      l10n.respectedSirMadamLabel,
      '',
      body,
      '',
      l10n.thankingYouLabel,
      '',
      l10n.yoursFaithfullyLabel,
      '',
      citizenName.trim(),
    ].join('\n');

    return GeneratedLetter(
      citizenName: citizenName.trim(),
      recommendedDepartment: recommendation.departmentLabel,
      departmentIcon: recommendation.icon,
      complaintCategory: recommendation.categoryLabel,
      subject: subject,
      body: body,
      fullLetter: fullLetter,
    );
  }

  static _Recommendation _recommendationFor(String complaint, AppLocalizations l10n) {
    final lowerComplaint = complaint.toLowerCase();

    if (_containsAny(lowerComplaint, ['road', 'pothole', 'bridge', 'street', 'highway'])) {
      return _Recommendation(_DepartmentType.roadsAndBuildings, l10n.departmentRoadsAndBuildings, l10n.categoryRoads, Icons.route_rounded);
    }
    if (_containsAny(lowerComplaint, ['water', 'pipeline', 'tap', 'drain', 'leak', 'irrigation', 'canal'])) {
      return _Recommendation(_DepartmentType.waterResources, l10n.departmentWaterResources, l10n.categoryWaterResources, Icons.water_drop_rounded);
    }
    if (_containsAny(lowerComplaint, ['electricity', 'power', 'light', 'streetlight', 'transformer'])) {
      return _Recommendation(_DepartmentType.electricity, l10n.departmentElectricity, l10n.categoryElectricity, Icons.flash_on_rounded);
    }
    if (_containsAny(lowerComplaint, ['police', 'theft', 'harassment', 'crime', 'safety'])) {
      return _Recommendation(_DepartmentType.police, l10n.departmentPolice, l10n.categoryPolice, Icons.local_police_rounded);
    }
    if (_containsAny(lowerComplaint, ['pension', 'welfare', 'disabled', 'widow', 'senior', 'scheme'])) {
      return _Recommendation(_DepartmentType.socialWelfare, l10n.departmentSocialWelfare, l10n.categorySocialWelfare, Icons.volunteer_activism_rounded);
    }
    if (_containsAny(lowerComplaint, ['ration', 'supply', 'public distribution', 'rice', 'fair price', 'civils supplies'])) {
      return _Recommendation(_DepartmentType.civilSupplies, l10n.departmentCivilSupplies, l10n.categoryCivilSupplies, Icons.store_rounded);
    }
    if (_containsAny(lowerComplaint, ['school', 'teacher', 'education', 'college', 'student'])) {
      return _Recommendation(_DepartmentType.education, l10n.departmentEducation, l10n.categoryEducation, Icons.school_rounded);
    }
    if (_containsAny(lowerComplaint, ['crop', 'farmer', 'agriculture', 'fertilizer', 'seed'])) {
      return _Recommendation(_DepartmentType.agriculture, l10n.departmentAgriculture, l10n.categoryAgriculture, Icons.agriculture_rounded);
    }
    if (_containsAny(lowerComplaint, ['health', 'hospital', 'doctor', 'ambulance', 'medic', 'medicine'])) {
      return _Recommendation(_DepartmentType.health, l10n.departmentHealth, l10n.categoryHealth, Icons.local_hospital_rounded);
    }
    if (_containsAny(lowerComplaint, ['municipal', 'sanitation', 'garbage', 'drainage', 'sewage', 'street cleaning'])) {
      return _Recommendation(_DepartmentType.municipal, l10n.departmentMunicipal, l10n.categoryMunicipal, Icons.location_city_rounded);
    }
    if (_containsAny(lowerComplaint, ['panchayat', 'village', 'gram', 'ward'])) {
      return _Recommendation(_DepartmentType.panchayat, l10n.departmentPanchayat, l10n.categoryPanchayat, Icons.holiday_village_rounded);
    }
    return _Recommendation(_DepartmentType.revenue, l10n.departmentRevenue, l10n.categoryRevenue, Icons.account_balance_rounded);
  }

  static String _subjectFor(_DepartmentType type, AppLocalizations l10n) {
    switch (l10n.locale.languageCode) {
      case 'hi':
        return switch (type) {
          _DepartmentType.roadsAndBuildings => 'सड़क मरम्मत के लिए तत्काल अनुरोध',
          _DepartmentType.waterResources => 'जल समस्या के समाधान हेतु तत्काल अनुरोध',
          _DepartmentType.electricity => 'विद्युत समस्या के समाधान हेतु अनुरोध',
          _DepartmentType.police => 'सुरक्षा एवं पुलिस सहायता के लिए अनुरोध',
          _DepartmentType.socialWelfare => 'सामाजिक कल्याण सहायता हेतु अनुरोध',
          _DepartmentType.civilSupplies => 'नागरिक आपूर्ति समस्या के लिए अनुरोध',
          _DepartmentType.education => 'शिक्षा संबंधी समस्या के समाधान हेतु अनुरोध',
          _DepartmentType.agriculture => 'कृषि समस्या के समाधान हेतु अनुरोध',
          _DepartmentType.health => 'स्वास्थ्य सुविधा सुधार हेतु अनुरोध',
          _DepartmentType.municipal => 'नगर प्रशासन कार्य के लिए अनुरोध',
          _DepartmentType.panchayat => 'पंचायती राज समस्या के समाधान हेतु अनुरोध',
          _DepartmentType.revenue => 'राजस्व संबंधी शिकायत हेतु अनुरोध',
        };
      case 'te':
        return switch (type) {
          _DepartmentType.roadsAndBuildings => 'తక్షణ రహదారి మరమ్మతుల కోసం విజ్ఞప్తి',
          _DepartmentType.waterResources => 'జల సమస్య పరిష్కారం కోసం విజ్ఞప్తి',
          _DepartmentType.electricity => 'విద్యుత్ సమస్య పరిష్కారం కోసం విజ్ఞప్తి',
          _DepartmentType.police => 'భద్రత మరియు పోలీసు సహాయం కోసం విజ్ఞప్తి',
          _DepartmentType.socialWelfare => 'సామాజిక సంక్షేమ సహాయం కోసం విజ్ఞప్తి',
          _DepartmentType.civilSupplies => 'సివిల్ సప్లైస్ సమస్య కోసం విజ్ఞప్తి',
          _DepartmentType.education => 'విద్యా సంబంధిత సమస్య కోసం విజ్ఞప్తి',
          _DepartmentType.agriculture => 'వ్యవసాయ సమస్య కోసం విజ్ఞప్తి',
          _DepartmentType.health => 'ఆరోగ్య సేవల మెరుగుదల కోసం విజ్ఞప్తి',
          _DepartmentType.municipal => 'మున్సిపల్ నిర్వహణ కోసం విజ్ఞప్తి',
          _DepartmentType.panchayat => 'పంచాయతీ రాజ్ సమస్య కోసం విజ్ఞప్తి',
          _DepartmentType.revenue => 'రెవెన్యూ సంబంధిత ఫిర్యాదు కోసం విజ్ఞప్తి',
        };
      default:
        return switch (type) {
          _DepartmentType.roadsAndBuildings => 'Request for urgent road repair',
          _DepartmentType.waterResources => 'Request for immediate water issue resolution',
          _DepartmentType.electricity => 'Request for electricity issue resolution',
          _DepartmentType.police => 'Request for safety and police assistance',
          _DepartmentType.socialWelfare => 'Request for social welfare support',
          _DepartmentType.civilSupplies => 'Request regarding civil supplies issue',
          _DepartmentType.education => 'Request regarding education issue',
          _DepartmentType.agriculture => 'Request regarding agriculture issue',
          _DepartmentType.health => 'Request for health service improvement',
          _DepartmentType.municipal => 'Request for municipal administration action',
          _DepartmentType.panchayat => 'Request regarding panchayat issue',
          _DepartmentType.revenue => 'Request regarding revenue grievance',
        };
    }
  }

  static String _bodyFor(String complaint, String categoryLabel, AppLocalizations l10n) {
    switch (l10n.locale.languageCode) {
      case 'hi':
        return 'मैं सादर निवेदन करता/करती हूँ कि $complaint। यह शिकायत $categoryLabel श्रेणी से संबंधित है और तत्काल ध्यान देने योग्य है। कृपया निरीक्षण कर आवश्यक कार्रवाई करने की कृपा करें।';
      case 'te':
        return 'నేను గౌరవపూర్వకంగా తెలియజేయునది ఏమనగా, $complaint. ఈ ఫిర్యాదు $categoryLabel విభాగానికి సంబంధించినది మరియు తక్షణ పరిశీలన అవసరం. దయచేసి అవసరమైన చర్యలు తీసుకోగలరు.';
      default:
        return 'I respectfully submit that $complaint. This grievance falls under the $categoryLabel category and requires immediate attention. Kindly arrange inspection and take the necessary action at the earliest.';
    }
  }

  static bool _containsAny(String value, List<String> keywords) {
    return keywords.any(value.contains);
  }
}

class _Recommendation {
  const _Recommendation(this.type, this.departmentLabel, this.categoryLabel, this.icon);

  final _DepartmentType type;
  final String departmentLabel;
  final String categoryLabel;
  final IconData icon;
}