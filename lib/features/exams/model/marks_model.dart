class MarksModel {
  final int id;
  final int studentId;
  final String subject;
  final int totalMarks;
  final int obtainedMarks;

  MarksModel({
    required this.id,
    required this.studentId,
    required this.subject,
    required this.totalMarks,
    required this.obtainedMarks,
  });

  factory MarksModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return MarksModel(
      id: json['id'],
      studentId: json['student_id'],
      subject: json['subject'],
      totalMarks: json['total_marks'],
      obtainedMarks: json['obtained_marks'],
    );
  }
}