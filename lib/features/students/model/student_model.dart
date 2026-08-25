class StudentModel {
  int id;
  String name;
  String rollNo;
  String className;

  String feeStatus;
  double attendance;

  StudentModel({
    required this.id,
    required this.name,
    required this.rollNo,
    required this.className,
    this.feeStatus = 'No Record',
    this.attendance = 0,
  });

  factory StudentModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return StudentModel(
      id: json['id'],
      name: json['name'] ?? '',
      rollNo: json['roll_no'] ?? '',
      className: json['class_name'] ?? '',
      feeStatus:
      json['fee_status'] ?? 'No Record',
      attendance:
      (json['attendance'] ?? 0).toDouble(),
    );
  }
}