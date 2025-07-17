class ActivityLog {
  final int id;
  final String title;
  final String description;

  ActivityLog({required this.id, required this.title, required this.description});

  factory ActivityLog.fromJson(Map<String, dynamic> json) {
    return ActivityLog(
      id: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }
}
