class AppConfig {
  static const String n8nVoiceComplaintWebhookUrl = String.fromEnvironment(
    'N8N_VOICE_COMPLAINT_WEBHOOK_URL',
    defaultValue: '',
  );
}