class TransactionModel {
  final String? category;
  final String? note;
  final String type;
  final int amount;
  final String? date;

  TransactionModel({
    this.category,
    this.note,
    required this.type,
    required this.amount,
    this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "note": note,
      "type": type,
      "amount": amount,
      "date": date,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      category: json["category"],
      note: json["note"],
      type: json["type"],
      amount: json["amount"],
      date: json["date"],
    );
  }
}
