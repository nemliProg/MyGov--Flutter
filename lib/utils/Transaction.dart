class Transaction {
  final String id;
  final double? amount;
  final int? date;
  final String? ministry;

  Transaction({required this.id, required this.amount, required this.date, required this.ministry});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: json['amount'] != null ? double.parse(json['amount'].toString()) : null,
      date: json['date'] != null ? int.parse(json['date']):0,
      ministry: json['ministry'] != null ? json['ministry']:"0",
    );
  }
}