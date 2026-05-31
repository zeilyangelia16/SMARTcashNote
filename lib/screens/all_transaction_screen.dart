import 'package:flutter/material.dart';
import 'package:smartcashnote/models/transaction.dart';
import 'package:smartcashnote/services/database_service.dart';
import 'package:intl/intl.dart';

class AllTransactionScreen extends StatefulWidget {
  final List<TransactionModel> transactions;

  const AllTransactionScreen({super.key, required this.transactions});

  @override
  State<AllTransactionScreen> createState() => _AllTransactionScreenState();

  IconData getCategoryIcon(String category) {
    switch (category) {
      case "Makanan":
        return Icons.fastfood;

      case "Transport":
        return Icons.directions_car;

      case "Belanja":
        return Icons.shopping_bag;

      case "Gaji":
        return Icons.account_balance_wallet;

      case "Hiburan":
        return Icons.movie;

      case "Tagihan":
        return Icons.receipt_long;

      case "Hadiah":
        return Icons.card_giftcard;

      default:
        return Icons.category;
    }
  }

  DateTime parseDate(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }

  Map<String, List<TransactionModel>> groupedTransactions(
    List<TransactionModel> source,
  ) {
    final grouped = <String, List<TransactionModel>>{};

    for (var item in source) {
      final monthYear = DateFormat(
        'MMMM yyyy',
        'id_ID',
      ).format(parseDate(item.date));

      grouped.putIfAbsent(monthYear, () => []).add(item);
    }

    return grouped;
  }
}

class _AllTransactionScreenState extends State<AllTransactionScreen> {
  late List<TransactionModel> _transactions;

  @override
  void initState() {
    super.initState();
    _transactions = List<TransactionModel>.from(widget.transactions);
  }

  IconData getCategoryIcon(String category) {
    switch (category) {
      case "Makanan":
        return Icons.fastfood;

      case "Transport":
        return Icons.directions_car;

      case "Belanja":
        return Icons.shopping_bag;

      case "Gaji":
        return Icons.account_balance_wallet;

      case "Hiburan":
        return Icons.movie;

      case "Tagihan":
        return Icons.receipt_long;

      case "Hadiah":
        return Icons.card_giftcard;

      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sortedTransactions = [..._transactions];

    sortedTransactions.sort((a, b) {
      final aDate = widget.parseDate(a.date);
      final bDate = widget.parseDate(b.date);
      return bDate.compareTo(aDate);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Semua Transaksi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _transactions.isEmpty
          ? const Center(child: Text("Belum ada transaksi"))
          : Builder(
              builder: (context) {
                final grouped = widget.groupedTransactions(sortedTransactions);

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: grouped.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...entry.value.map((item) {
                          final isIncome = item.type == "Pemasukan";

                          return Dismissible(
                            key: ValueKey(item.id ?? UniqueKey()),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (direction) async {
                              if (item.id != null) {
                                await DatabaseService.deleteTransaction(
                                  item.id!,
                                );
                              }
                              setState(() {
                                _transactions.removeWhere(
                                  (transaction) => transaction.id == item.id,
                                );
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${item.category} berhasil dihapus",
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 0,
                              margin: const EdgeInsets.only(bottom: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                minVerticalPadding: 0,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                leading: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.indigo.withOpacity(
                                    0.1,
                                  ),
                                  child: Icon(
                                    widget.getCategoryIcon(item.category ?? ""),
                                    color: Colors.indigo,
                                    size: 18,
                                  ),
                                ),
                                title: Text(
                                  item.category ?? "-",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.note ?? "",
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      DateFormat(
                                        'dd MMM yyyy',
                                        'id_ID',
                                      ).format(widget.parseDate(item.date)),
                                      style: const TextStyle(
                                        fontSize: 9,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  isIncome
                                      ? "+ Rp ${item.amount}"
                                      : "- Rp ${item.amount}",
                                  style: TextStyle(
                                    color: isIncome ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
