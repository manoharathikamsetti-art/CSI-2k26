class Complaint {
  const Complaint({
    required this.id,
    required this.tokenNumber,
    required this.name,
    required this.department,
    required this.category,
    required this.status,
    required this.date,
    required this.summary,
    required this.priority,
    required this.source,
  });

  final String id;
  final String tokenNumber;
  final String name;
  final String department;
  final String category;
  final String status;
  final String date;
  final String summary;
  final String priority;
  final String source;

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'] as String,
      tokenNumber: json['tokenNumber'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      category: json['category'] as String,
      status: json['status'] as String,
      date: json['date'] as String,
      summary: json['summary'] as String,
      priority: json['priority'] as String,
      source: json['source'] as String,
    );
  }
}
