class AttendanceModel {
  final int id;
  final int studentId;
  final String status;

  AttendanceModel({
    required this.id,
    required this.studentId,
    required this.status,
  });

  factory AttendanceModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return AttendanceModel(
      id: json['id'],
      studentId: json['student_id'],
      status: json['status'] ?? '',
    );
  }
}