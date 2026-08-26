class ClassModel {
  final int id;
  final String name;
  final String teacher;

  ClassModel({
    required this.id,
    required this.name,
    required this.teacher,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      name: json['name'] ?? '',
      teacher: json['teacher'] ?? '',
    );
  }
}