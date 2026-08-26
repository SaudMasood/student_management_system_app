class FeeModel {
  final int id;
  final int studentId;
  final double amount;
  final String status;

  FeeModel({
    required this.id,
    required this.studentId,
    required this.amount,
    required this.status,
  });

  factory FeeModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return FeeModel(
      id: json['id'] as int,
      studentId: json['student_id'] as int,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] ?? '',
    );
  }
}