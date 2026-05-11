import 'package:flutter/material.dart';

class AllTransactionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const AllTransactionScreen({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Semua Transaksi"), centerTitle: true),

      body: transactions.isEmpty
          ? const Center(child: Text("Belum ada transaksi"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: transactions.length,

              itemBuilder: (context, index) {
                final item = transactions[index];

                final isIncome = item["type"] == "Pemasukan";

                return Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 14),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),

                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: isIncome
                          ? Colors.green[50]
                          : Colors.red[50],

                      child: Icon(
                        isIncome ? Icons.arrow_downward : Icons.arrow_upward,

                        color: isIncome ? Colors.green : Colors.red,
                      ),
                    ),

                    title: Text(
                      item["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(item["category"] ?? ""),

                        const SizedBox(height: 4),

                        Text(
                          item["date"] != null
                              ? item["date"].toString().substring(0, 10)
                              : "",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    trailing: Text(
                      isIncome
                          ? "+ Rp ${item["amount"]}"
                          : "- Rp ${item["amount"]}",

                      style: TextStyle(
                        color: isIncome ? Colors.green : Colors.red,

                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
