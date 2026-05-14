class TransactionModel {
  final int? id;
  final int? userId;
  final String type;
  final int amount;
  final String category;
  final String note;
  final String date;

  TransactionModel({
    this.id,
    this.userId,
    required this.type,
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user_id": userId,
      "type": type,
      "amount": amount,
      "category": category,
      "note": note,
      "date": date,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map["id"],
      userId: map["user_id"],
      type: map["type"],
      amount: map["amount"],
      category: map["category"],
      note: map["note"],
      date: map["date"],
    );
  }
}
