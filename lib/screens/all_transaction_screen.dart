import 'package:flutter/material.dart';
import 'package:smartcashnote/models/transaction.dart';

class AllTransactionScreen extends StatelessWidget {
  final List<TransactionModel> transactions;

  const AllTransactionScreen({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final sortedTransactions = [...transactions];

    sortedTransactions.sort((a, b) {
      final aParts = a.date!.split('/');
      final bParts = b.date!.split('/');

      final aDate = DateTime(
        int.parse(aParts[2]),
        int.parse(aParts[1]),
        int.parse(aParts[0]),
      );

      final bDate = DateTime(
        int.parse(bParts[2]),
        int.parse(bParts[1]),
        int.parse(bParts[0]),
      );

      return bDate.compareTo(aDate);
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Semua Transaksi"), centerTitle: true),

      body: transactions.isEmpty
          ? const Center(child: Text("Belum ada transaksi"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sortedTransactions.length,

              itemBuilder: (context, index) {
                final item = sortedTransactions[index];

                final isIncome = item.type == "Pemasukan";

                return Card(
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
                      radius: 16,

                      backgroundColor: isIncome
                          ? Colors.green[50]
                          : Colors.red[50],

                      child: Icon(
                        isIncome ? Icons.arrow_downward : Icons.arrow_upward,

                        size: 16,

                        color: isIncome ? Colors.green : Colors.red,
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
                          item.date ?? "",

                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    trailing: Text(
                      isIncome ? "+ Rp ${item.amount}" : "- Rp ${item.amount}",

                      style: TextStyle(
                        color: isIncome ? Colors.green : Colors.red,

                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
