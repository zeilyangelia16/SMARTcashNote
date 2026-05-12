import 'package:flutter/material.dart';
import 'package:smartcashnote/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel item;
  final bool isDarkMode;

  const TransactionItem({
    super.key,
    required this.item,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final subTextColor = isDarkMode ? Colors.white70 : Colors.grey;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(14),

        leading: CircleAvatar(
          radius: 28,
          backgroundColor: item.type == "Pemasukan"
              ? Colors.green[50]
              : Colors.red[50],

          child: Icon(
            item.type == "Pemasukan"
                ? Icons.arrow_downward
                : Icons.arrow_upward,

            color: item.type == "Pemasukan" ? Colors.green : Colors.red,
          ),
        ),

        title: Text(
          item.category ?? "-",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.note ?? "", style: TextStyle(color: subTextColor)),

            const SizedBox(height: 4),

            Text(
              item.date ?? "",
              style: TextStyle(fontSize: 12, color: subTextColor),
            ),
          ],
        ),

        trailing: Text(
          item.type == "Pemasukan"
              ? "+ Rp ${item.amount}"
              : "- Rp ${item.amount}",

          style: TextStyle(
            color: item.type == "Pemasukan" ? Colors.green : Colors.red,

            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
