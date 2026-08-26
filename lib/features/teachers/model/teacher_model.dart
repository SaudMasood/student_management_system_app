class TeacherModel {
  final int id;
  final String name;
  final String subject;
  final String phone;

  TeacherModel({
    required this.id,
    required this.name,
    required this.subject,
    required this.phone,
  });

  factory TeacherModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return TeacherModel(
      id: json['id'],
      name: json['name'] ?? '',
      subject: json['subject'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}