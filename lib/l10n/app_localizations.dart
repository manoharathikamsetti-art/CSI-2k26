import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('te'), Locale('en'), Locale('hi')];

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'AI-Based Smart Grievance Drafting',
      'appTagline': 'Draft professional grievance letters and route them to the right department.',
      'splashLoading': 'Preparing the language experience...',
      'languageTitle': 'Language Selection',
      'languageSubtitle': 'Choose the language for the entire experience.',
      'englishLanguage': 'English',
      'teluguLanguage': 'తెలుగు',
      'hindiLanguage': 'हिन्दी',
      'citizenPortal': 'Citizen Portal',
      'officerPortal': 'Officer Portal',
      'homeTitle': 'Home',
      'homeSubtitle': 'Select how the citizen wants to submit the grievance.',
      'homeInstruction': 'Choose voice or text to prepare the letter.',
      'languageCardHint': 'Tap to select this language.',
      'searchBarHint': 'Search complaints, tokens or departments',
      'voiceComplaintTitle': 'Voice Complaint',
      'voiceComplaintSubtitle': 'Record the grievance and generate a formal letter.',
      'textComplaintTitle': 'Text Complaint',
      'textComplaintSubtitle': 'Type the grievance and generate a formal letter.',
      'citizenNameLabel': 'Citizen Name',
      'citizenNameHint': 'Enter Citizen Name',
      'complaintLabel': 'Complaint',
      'complaintHint': 'Describe your grievance here...',
      'generateLetterButton': 'Generate Letter',
      'transcribedComplaintHeading': 'Transcribed Complaint',
      'recordedAudioLabel': 'Recorded Audio',
      'recordingInProgressLabel': 'Recording in progress',
      'audioReadyLabel': 'Audio ready for playback',
      'noRecordingYetLabel': 'No recording yet',
      'playButton': 'Play',
      'pauseButton': 'Pause',
      'deleteRecordingButton': 'Delete Recording',
      'recordButton': 'Record',
      'stopButton': 'Stop',
      'recordedTextPreviewLabel': 'Recorded Text Preview',
      'recordedTextHint': 'The speech transcript will appear here.',
      'recordingPlaceholder': 'Recorded complaint text will appear here.',
      'validationCitizenNameRequired': 'Citizen name cannot be empty.',
      'validationComplaintRequired': 'Complaint cannot be empty.',
      'validationRecordingRequired': 'Please record the audio before generating the letter.',
      'validationRecordedTextRequired': 'Voice or text content is required.',
      'microphonePermissionRequired': 'Microphone permission is required to record audio.',
      'recordingFailedSnackbar': 'Unable to start recording. Please try again.',
      'uploadFailedSnackbar': 'Unable to upload audio. Please try again.',
      'webhookNotConfiguredSnackbar': 'Voice complaint webhook is not configured.',
      'generatedLetterTitle': 'Generated Letter',
      'citizenNameHeading': 'Citizen Name',
      'recommendedDepartmentHeading': 'Recommended Department',
      'complaintCategoryHeading': 'Complaint Category',
      'generatedLetterHeading': 'Generated Letter',
      'editLetterButton': 'Edit Letter',
      'saveChangesButton': 'Save Changes',
      'copyLetterButton': 'Copy Letter',
      'printLetterButton': 'Print Letter',
      'generateAnotherLetterButton': 'Generate Another Letter',
      'editingModeBadge': 'Editing Mode',
      'latestVersionBadge': 'Latest Version',
      'unsavedChangesTitle': 'Unsaved Changes',
      'unsavedChangesMessage': 'You have unsaved changes.\n\nDo you want to save before leaving?',
      'cancelButton': 'Cancel',
      'discardButton': 'Discard',
      'saveButton': 'Save',
      'letterUpdatedSnackbar': 'Letter updated successfully.',
      'toLabel': 'To',
      'districtCollectorLabel': 'The District Collector',
      'districtCollectorateLabel': 'District Collectorate',
      'subjectLabel': 'Subject',
      'respectedSirMadamLabel': 'Respected Sir/Madam,',
      'thankingYouLabel': 'Thanking You,',
      'yoursFaithfullyLabel': 'Yours Faithfully,',
      'snackLetterCopied': 'Letter copied to clipboard.',
      'snackNothingToCopy': 'There is no letter to copy.',
      'mockDisclaimer': 'All data shown in this build is mock data for frontend demonstration only.',
      'processingLabel': 'Processing...',
      'loadingSubtitle': 'AI summarization and classification in progress',
      'errorTitle': 'Something went wrong',
      'retryButton': 'Retry',
      'confirmButton': 'Confirm',
      'continueButton': 'Continue',
      'departmentRevenue': 'Revenue Department',
      'departmentMunicipal': 'Municipal Administration',
      'departmentPanchayat': 'Panchayat Raj',
      'departmentPolice': 'Police Department',
      'departmentSocialWelfare': 'Social Welfare',
      'departmentCivilSupplies': 'Civil Supplies',
      'departmentEducation': 'Education Department',
      'departmentAgriculture': 'Agriculture',
      'departmentHealth': 'Health Department',
      'departmentElectricity': 'Electricity Department',
      'departmentWaterResources': 'Water Resources',
      'departmentRoadsAndBuildings': 'Roads & Buildings',
      'categoryRevenue': 'Revenue',
      'categoryMunicipal': 'Municipal Administration',
      'categoryPanchayat': 'Panchayat Raj',
      'categoryPolice': 'Police',
      'categorySocialWelfare': 'Social Welfare',
      'categoryCivilSupplies': 'Civil Supplies',
      'categoryEducation': 'Education',
      'categoryAgriculture': 'Agriculture',
      'categoryHealth': 'Health',
      'categoryElectricity': 'Electricity',
      'categoryWaterResources': 'Water Resources',
      'categoryRoads': 'Roads & Buildings',
    },
    'te': {
      'appName': 'ఏఐ ఆధారిత స్మార్ట్ ఫిర్యాదు ముసాయిదా',
      'appTagline': 'వృత్తిపరమైన ఫిర్యాదు లేఖలను తయారుచేసి సరైన శాఖకు మార్గనిర్దేశం చేస్తుంది.',
      'splashLoading': 'భాషా అనుభవాన్ని సిద్ధం చేస్తోంది...',
      'languageTitle': 'భాష ఎంపిక',
      'languageSubtitle': 'మొత్తం అనుభవానికి ఉపయోగించే భాషను ఎంచుకోండి.',
      'englishLanguage': 'English',
      'teluguLanguage': 'తెలుగు',
      'hindiLanguage': 'హिन्दी',
      'citizenPortal': 'పౌర పోర్టల్',
      'officerPortal': 'అధికారి పోర్టల్',
      'homeTitle': 'హోమ్',
      'homeSubtitle': 'ఫిర్యాదును సమర్పించే విధానాన్ని ఎంచుకోండి.',
      'homeInstruction': 'లేఖ సిద్ధం చేయడానికి వాయిస్ లేదా టెక్స్ట్‌ను ఎంచుకోండి.',
      'languageCardHint': 'ఈ భాషను ఎంచుకోవడానికి ట్యాప్ చేయండి.',
      'searchBarHint': 'ఫిర్యాదులు, టోకెన్లు లేదా శాఖలను శోధించండి',
      'voiceComplaintTitle': 'వాయిస్ ఫిర్యాదు',
      'voiceComplaintSubtitle': 'ఫిర్యాదును రికార్డ్ చేసి అధికారిక లేఖను రూపొందించండి.',
      'textComplaintTitle': 'టెక్స్ట్ ఫిర్యాదు',
      'textComplaintSubtitle': 'ఫిర్యాదును టైప్ చేసి అధికారిక లేఖను రూపొందించండి.',
      'citizenNameLabel': 'పౌరుని పేరు',
      'citizenNameHint': 'పౌరుని పేరు నమోదు చేయండి',
      'complaintLabel': 'ఫిర్యాదు',
      'complaintHint': 'మీ సమస్యను ఇక్కడ వివరించండి...',
      'generateLetterButton': 'లేఖను సృష్టించండి',
      'transcribedComplaintHeading': 'ట్రాన్స్‌క్రైబ్ చేసిన ఫిర్యాదు',
      'recordedAudioLabel': 'రికార్డ్ చేసిన ఆడియో',
      'recordingInProgressLabel': 'రికార్డింగ్ జరుగుతోంది',
      'audioReadyLabel': 'ప్లేబ్యాక్‌కు ఆడియో సిద్ధంగా ఉంది',
      'noRecordingYetLabel': 'ఇంకా రికార్డింగ్ లేదు',
      'playButton': 'ప్లే',
      'pauseButton': 'పాజ్',
      'deleteRecordingButton': 'రికార్డింగ్ తొలగించండి',
      'recordButton': 'రికార్డ్',
      'stopButton': 'ఆపు',
      'recordedTextPreviewLabel': 'రికార్డ్ చేసిన పాఠ్యం',
      'recordedTextHint': 'ఇక్కడ వాయిస్ ట్రాన్స్‌క్రిప్ట్ కనిపిస్తుంది.',
      'recordingPlaceholder': 'రికార్డ్ చేసిన ఫిర్యాదు పాఠ్యం ఇక్కడ కనిపిస్తుంది.',
      'validationCitizenNameRequired': 'పౌరుని పేరు ఖాళీగా ఉండకూడదు.',
      'validationComplaintRequired': 'ఫిర్యాదు ఖాళీగా ఉండకూడదు.',
      'validationRecordingRequired': 'లేఖను సృష్టించే ముందు ఆడియోను రికార్డ్ చేయండి.',
      'validationRecordedTextRequired': 'వాయిస్ లేదా పాఠ్య సమాచారం అవసరం.',
      'microphonePermissionRequired': 'ఆడియో రికార్డ్ చేయడానికి మైక్రోఫోన్ అనుమతి అవసరం.',
      'recordingFailedSnackbar': 'రికార్డింగ్ ప్రారంభించలేకపోయాము. దయచేసి మళ్లీ ప్రయత్నించండి.',
      'uploadFailedSnackbar': 'ఆడియోను అప్‌లోడ్ చేయడం సాధ్యపడలేదు. దయచేసి మళ్లీ ప్రయత్నించండి.',
      'webhookNotConfiguredSnackbar': 'వాయిస్ ఫిర్యాదు వెబ్‌హుక్ కాన్ఫిగర్ కాలేదు.',
      'generatedLetterTitle': 'సృష్టించిన లేఖ',
      'citizenNameHeading': 'పౌరుని పేరు',
      'recommendedDepartmentHeading': 'సిఫారసు చేసిన శాఖ',
      'complaintCategoryHeading': 'ఫిర్యాదు వర్గం',
      'generatedLetterHeading': 'సృష్టించిన లేఖ',
      'editLetterButton': 'లేఖను సవరించండి',
      'saveChangesButton': 'మార్పులను సేవ్ చేయండి',
      'copyLetterButton': 'లేఖను కాపీ చేయండి',
      'printLetterButton': 'లేఖను ప్రింట్ చేయండి',
      'generateAnotherLetterButton': 'మరొక లేఖను సృష్టించండి',
      'editingModeBadge': 'సవరణ మోడ్',
      'latestVersionBadge': 'తాజా వెర్షన్',
      'unsavedChangesTitle': 'సేవ్ చేయని మార్పులు',
      'unsavedChangesMessage': 'మీకు సేవ్ చేయని మార్పులు ఉన్నాయి.\n\nనిష్క్రమించే ముందు సేవ్ చేయాలా?',
      'cancelButton': 'రద్దు',
      'discardButton': 'వదిలేయి',
      'saveButton': 'సేవ్',
      'letterUpdatedSnackbar': 'లేఖ విజయవంతంగా నవీకరించబడింది.',
      'toLabel': 'కు',
      'districtCollectorLabel': 'జిల్లా కలెక్టర్',
      'districtCollectorateLabel': 'జిల్లా కలెక్టర్ కార్యాలయం',
      'subjectLabel': 'విషయం',
      'respectedSirMadamLabel': 'గౌరవనీయులైన సర్/మేడమ్,',
      'thankingYouLabel': 'ధన్యవాదాలతో,',
      'yoursFaithfullyLabel': 'వినయపూర్వకంగా,',
      'snackLetterCopied': 'లేఖ క్లిప్‌బోర్డుకు కాపీ అయ్యింది.',
      'snackNothingToCopy': 'కాపీ చేయడానికి లేఖ లేదు.',
      'mockDisclaimer': 'ఈ బిల్డ్‌లో చూపబడే మొత్తం డేటా ఫ్రంట్‌ఎండ్ ప్రదర్శన కోసం మాత్రమే మాక్ డేటా.',
      'processingLabel': 'ప్రాసెస్ చేస్తోంది...',
      'loadingSubtitle': 'AI సంక్షిప్తీకరణ మరియు వర్గీకరణ జరుగుతోంది',
      'errorTitle': 'ఏదో తప్పు జరిగింది',
      'retryButton': 'మళ్లీ ప్రయత్నించండి',
      'confirmButton': 'ధృవీకరించు',
      'continueButton': 'కొనసాగించండి',
      'departmentRevenue': 'రెవెన్యూ శాఖ',
      'departmentMunicipal': 'మున్సిపల్ అడ్మినిస్ట్రేషన్',
      'departmentPanchayat': 'పంచాయతీ రాజ్',
      'departmentPolice': 'పోలీస్ శాఖ',
      'departmentSocialWelfare': 'సామాజిక సంక్షేమ శాఖ',
      'departmentCivilSupplies': 'సివిల్ సప్లైస్',
      'departmentEducation': 'విద్యా శాఖ',
      'departmentAgriculture': 'వ్యవసాయం',
      'departmentHealth': 'ఆరోగ్య శాఖ',
      'departmentElectricity': 'విద్యుత్ శాఖ',
      'departmentWaterResources': 'జల వనరులు',
      'departmentRoadsAndBuildings': 'రోడ్లు & భవనాలు',
      'categoryRevenue': 'రెవెన్యూ',
      'categoryMunicipal': 'మున్సిపల్ అడ్మినిస్ట్రేషన్',
      'categoryPanchayat': 'పంచాయతీ రాజ్',
      'categoryPolice': 'పోలీస్',
      'categorySocialWelfare': 'సామాజిక సంక్షేమం',
      'categoryCivilSupplies': 'సివిల్ సప్లైస్',
      'categoryEducation': 'విద్య',
      'categoryAgriculture': 'వ్యవసాయం',
      'categoryHealth': 'ఆరోగ్యం',
      'categoryElectricity': 'విద్యుత్',
      'categoryWaterResources': 'జల వనరులు',
      'categoryRoads': 'రోడ్లు & భవనాలు',
    },
    'hi': {
      'appName': 'AI-आधारित स्मार्ट शिकायत मसौदा',
      'appTagline': 'पेशेवर शिकायत पत्र तैयार करें और उन्हें सही विभाग तक पहुंचाएं।',
      'splashLoading': 'भाषा अनुभव तैयार किया जा रहा है...',
      'languageTitle': 'भाषा चयन',
      'languageSubtitle': 'पूरे अनुभव के लिए भाषा चुनें।',
      'englishLanguage': 'English',
      'teluguLanguage': 'తెలుగు',
      'hindiLanguage': 'हिन्दी',
      'citizenPortal': 'नागरिक पोर्टल',
      'officerPortal': 'अधिकारी पोर्टल',
      'homeTitle': 'होम',
      'homeSubtitle': 'शिकायत भेजने का तरीका चुनें।',
      'homeInstruction': 'पत्र तैयार करने के लिए वॉयस या टेक्स्ट चुनें।',
      'languageCardHint': 'इस भाषा को चुनने के लिए टैप करें।',
      'searchBarHint': 'शिकायतें, टोकन या विभाग खोजें',
      'voiceComplaintTitle': 'वॉयस शिकायत',
      'voiceComplaintSubtitle': 'शिकायत रिकॉर्ड करें और औपचारिक पत्र बनाएं।',
      'textComplaintTitle': 'टेक्स्ट शिकायत',
      'textComplaintSubtitle': 'शिकायत टाइप करें और औपचारिक पत्र बनाएं।',
      'citizenNameLabel': 'नागरिक का नाम',
      'citizenNameHint': 'नागरिक का नाम दर्ज करें',
      'complaintLabel': 'शिकायत',
      'complaintHint': 'अपनी शिकायत यहाँ लिखें...',
      'generateLetterButton': 'पत्र बनाएं',
      'transcribedComplaintHeading': 'लिपिबद्ध शिकायत',
      'recordedAudioLabel': 'रिकॉर्ड किया गया ऑडियो',
      'recordingInProgressLabel': 'रिकॉर्डिंग चल रही है',
      'audioReadyLabel': 'ऑडियो प्लेबैक के लिए तैयार है',
      'noRecordingYetLabel': 'अभी कोई रिकॉर्डिंग नहीं',
      'playButton': 'चलाएँ',
      'pauseButton': 'रोकें',
      'deleteRecordingButton': 'रिकॉर्डिंग हटाएँ',
      'recordButton': 'रिकॉर्ड',
      'stopButton': 'रोकें',
      'recordedTextPreviewLabel': 'रिकॉर्ड किया गया पाठ',
      'recordedTextHint': 'स्पीच ट्रांसक्रिप्ट यहाँ दिखाई देगा।',
      'recordingPlaceholder': 'रिकॉर्ड की गई शिकायत का पाठ यहाँ दिखाई देगा।',
      'validationCitizenNameRequired': 'नागरिक का नाम खाली नहीं हो सकता।',
      'validationComplaintRequired': 'शिकायत खाली नहीं हो सकती।',
      'validationRecordingRequired': 'पत्र बनाने से पहले ऑडियो रिकॉर्ड करें।',
      'validationRecordedTextRequired': 'वॉयस या टेक्स्ट सामग्री आवश्यक है।',
      'microphonePermissionRequired': 'ऑडियो रिकॉर्ड करने के लिए माइक्रोफ़ोन अनुमति आवश्यक है।',
      'recordingFailedSnackbar': 'रिकॉर्डिंग शुरू नहीं हो सकी। कृपया पुनः प्रयास करें।',
      'uploadFailedSnackbar': 'ऑडियो अपलोड नहीं हो सका। कृपया पुनः प्रयास करें।',
      'webhookNotConfiguredSnackbar': 'वॉयस शिकायत वेबहुक कॉन्फ़िगर नहीं है।',
      'generatedLetterTitle': 'तैयार पत्र',
      'citizenNameHeading': 'नागरिक का नाम',
      'recommendedDepartmentHeading': 'अनुशंसित विभाग',
      'complaintCategoryHeading': 'शिकायत श्रेणी',
      'generatedLetterHeading': 'तैयार पत्र',
      'editLetterButton': 'पत्र संपादित करें',
      'saveChangesButton': 'परिवर्तन सहेजें',
      'copyLetterButton': 'पत्र कॉपी करें',
      'printLetterButton': 'पत्र प्रिंट करें',
      'generateAnotherLetterButton': 'एक और पत्र बनाएं',
      'editingModeBadge': 'संपादन मोड',
      'latestVersionBadge': 'नवीनतम संस्करण',
      'unsavedChangesTitle': 'असहेजे गए परिवर्तन',
      'unsavedChangesMessage': 'आपके पास असहेजे गए परिवर्तन हैं.\n\nक्या आप छोड़ने से पहले सहेजना चाहते हैं?',
      'cancelButton': 'रद्द करें',
      'discardButton': 'त्यागें',
      'saveButton': 'सहेजें',
      'letterUpdatedSnackbar': 'पत्र सफलतापूर्वक अपडेट हो गया।',
      'toLabel': 'प्रति',
      'districtCollectorLabel': 'जिलाधिकारी',
      'districtCollectorateLabel': 'जिला कलेक्ट्रेट',
      'subjectLabel': 'विषय',
      'respectedSirMadamLabel': 'मान्यवर,',
      'thankingYouLabel': 'धन्यवाद,',
      'yoursFaithfullyLabel': 'सादर,',
      'snackLetterCopied': 'पत्र क्लिपबोर्ड में कॉपी हो गया है।',
      'snackNothingToCopy': 'कॉपी करने के लिए कोई पत्र नहीं है।',
      'mockDisclaimer': 'इस बिल्ड में दिखाया गया सारा डेटा केवल फ्रंटएंड प्रदर्शन के लिए मॉक डेटा है।',
      'processingLabel': 'प्रसंस्करण जारी है...',
      'loadingSubtitle': 'AI सारांश और वर्गीकरण प्रगति पर है',
      'errorTitle': 'कुछ गलत हो गया',
      'retryButton': 'फिर से कोशिश करें',
      'confirmButton': 'पुष्टि करें',
      'continueButton': 'जारी रखें',
      'departmentRevenue': 'राजस्व विभाग',
      'departmentMunicipal': 'नगर प्रशासन',
      'departmentPanchayat': 'पंचायती राज',
      'departmentPolice': 'पुलिस विभाग',
      'departmentSocialWelfare': 'सामाजिक कल्याण',
      'departmentCivilSupplies': 'नागरिक आपूर्ति',
      'departmentEducation': 'शिक्षा विभाग',
      'departmentAgriculture': 'कृषि',
      'departmentHealth': 'स्वास्थ्य विभाग',
      'departmentElectricity': 'विद्युत विभाग',
      'departmentWaterResources': 'जल संसाधन',
      'departmentRoadsAndBuildings': 'सड़क एवं भवन',
      'categoryRevenue': 'राजस्व',
      'categoryMunicipal': 'नगर प्रशासन',
      'categoryPanchayat': 'पंचायती राज',
      'categoryPolice': 'पुलिस',
      'categorySocialWelfare': 'सामाजिक कल्याण',
      'categoryCivilSupplies': 'नागरिक आपूर्ति',
      'categoryEducation': 'शिक्षा',
      'categoryAgriculture': 'कृषि',
      'categoryHealth': 'स्वास्थ्य',
      'categoryElectricity': 'विद्युत',
      'categoryWaterResources': 'जल संसाधन',
      'categoryRoads': 'सड़क एवं भवन',
    },
  };

  String _value(String key) {
    final languageCode = locale.languageCode;
    return _localizedValues[languageCode]?[key] ?? _localizedValues['te']![key] ?? _localizedValues['en']![key]!;
  }

  String get appName => _value('appName');
  String get appTagline => _value('appTagline');
  String get splashLoading => _value('splashLoading');
  String get languageTitle => _value('languageTitle');
  String get languageSubtitle => _value('languageSubtitle');
  String get englishLanguage => _value('englishLanguage');
  String get teluguLanguage => _value('teluguLanguage');
  String get hindiLanguage => _value('hindiLanguage');
  String get citizenPortal => _value('citizenPortal');
  String get officerPortal => _value('officerPortal');
  String get homeTitle => _value('homeTitle');
  String get homeSubtitle => _value('homeSubtitle');
  String get homeInstruction => _value('homeInstruction');
  String get languageCardHint => _value('languageCardHint');
  String get searchBarHint => _value('searchBarHint');
  String get voiceComplaintTitle => _value('voiceComplaintTitle');
  String get voiceComplaintSubtitle => _value('voiceComplaintSubtitle');
  String get textComplaintTitle => _value('textComplaintTitle');
  String get textComplaintSubtitle => _value('textComplaintSubtitle');
  String get citizenNameLabel => _value('citizenNameLabel');
  String get citizenNameHint => _value('citizenNameHint');
  String get complaintLabel => _value('complaintLabel');
  String get complaintHint => _value('complaintHint');
  String get generateLetterButton => _value('generateLetterButton');
  String get transcribedComplaintHeading => _value('transcribedComplaintHeading');
  String get recordedAudioLabel => _value('recordedAudioLabel');
  String get recordingInProgressLabel => _value('recordingInProgressLabel');
  String get audioReadyLabel => _value('audioReadyLabel');
  String get noRecordingYetLabel => _value('noRecordingYetLabel');
  String get playButton => _value('playButton');
  String get pauseButton => _value('pauseButton');
  String get deleteRecordingButton => _value('deleteRecordingButton');
  String get recordButton => _value('recordButton');
  String get stopButton => _value('stopButton');
  String get recordedTextPreviewLabel => _value('recordedTextPreviewLabel');
  String get recordedTextHint => _value('recordedTextHint');
  String get recordingPlaceholder => _value('recordingPlaceholder');
  String get validationCitizenNameRequired => _value('validationCitizenNameRequired');
  String get validationComplaintRequired => _value('validationComplaintRequired');
  String get validationRecordingRequired => _value('validationRecordingRequired');
  String get validationRecordedTextRequired => _value('validationRecordedTextRequired');
  String get microphonePermissionRequired => _value('microphonePermissionRequired');
  String get recordingFailedSnackbar => _value('recordingFailedSnackbar');
  String get uploadFailedSnackbar => _value('uploadFailedSnackbar');
  String get webhookNotConfiguredSnackbar => _value('webhookNotConfiguredSnackbar');
  String get generatedLetterTitle => _value('generatedLetterTitle');
  String get citizenNameHeading => _value('citizenNameHeading');
  String get recommendedDepartmentHeading => _value('recommendedDepartmentHeading');
  String get complaintCategoryHeading => _value('complaintCategoryHeading');
  String get generatedLetterHeading => _value('generatedLetterHeading');
  String get editLetterButton => _value('editLetterButton');
  String get saveChangesButton => _value('saveChangesButton');
  String get copyLetterButton => _value('copyLetterButton');
  String get printLetterButton => _value('printLetterButton');
  String get generateAnotherLetterButton => _value('generateAnotherLetterButton');
  String get editingModeBadge => _value('editingModeBadge');
  String get latestVersionBadge => _value('latestVersionBadge');
  String get unsavedChangesTitle => _value('unsavedChangesTitle');
  String get unsavedChangesMessage => _value('unsavedChangesMessage');
  String get cancelButton => _value('cancelButton');
  String get discardButton => _value('discardButton');
  String get saveButton => _value('saveButton');
  String get letterUpdatedSnackbar => _value('letterUpdatedSnackbar');
  String get toLabel => _value('toLabel');
  String get districtCollectorLabel => _value('districtCollectorLabel');
  String get districtCollectorateLabel => _value('districtCollectorateLabel');
  String get subjectLabel => _value('subjectLabel');
  String get respectedSirMadamLabel => _value('respectedSirMadamLabel');
  String get thankingYouLabel => _value('thankingYouLabel');
  String get yoursFaithfullyLabel => _value('yoursFaithfullyLabel');
  String get snackLetterCopied => _value('snackLetterCopied');
  String get snackNothingToCopy => _value('snackNothingToCopy');
  String get mockDisclaimer => _value('mockDisclaimer');
  String get processingLabel => _value('processingLabel');
  String get loadingSubtitle => _value('loadingSubtitle');
  String get errorTitle => _value('errorTitle');
  String get retryButton => _value('retryButton');
  String get confirmButton => _value('confirmButton');
  String get continueButton => _value('continueButton');
  String get departmentRevenue => _value('departmentRevenue');
  String get departmentMunicipal => _value('departmentMunicipal');
  String get departmentPanchayat => _value('departmentPanchayat');
  String get departmentPolice => _value('departmentPolice');
  String get departmentSocialWelfare => _value('departmentSocialWelfare');
  String get departmentCivilSupplies => _value('departmentCivilSupplies');
  String get departmentEducation => _value('departmentEducation');
  String get departmentAgriculture => _value('departmentAgriculture');
  String get departmentHealth => _value('departmentHealth');
  String get departmentElectricity => _value('departmentElectricity');
  String get departmentWaterResources => _value('departmentWaterResources');
  String get departmentRoadsAndBuildings => _value('departmentRoadsAndBuildings');
  String get categoryRevenue => _value('categoryRevenue');
  String get categoryMunicipal => _value('categoryMunicipal');
  String get categoryPanchayat => _value('categoryPanchayat');
  String get categoryPolice => _value('categoryPolice');
  String get categorySocialWelfare => _value('categorySocialWelfare');
  String get categoryCivilSupplies => _value('categoryCivilSupplies');
  String get categoryEducation => _value('categoryEducation');
  String get categoryAgriculture => _value('categoryAgriculture');
  String get categoryHealth => _value('categoryHealth');
  String get categoryElectricity => _value('categoryElectricity');
  String get categoryWaterResources => _value('categoryWaterResources');
  String get categoryRoads => _value('categoryRoads');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any((supportedLocale) => supportedLocale.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => Localizations.of<AppLocalizations>(this, AppLocalizations)!;
}