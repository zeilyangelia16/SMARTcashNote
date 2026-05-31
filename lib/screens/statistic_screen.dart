import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class StatisticScreen extends StatelessWidget {
  final List<TransactionModel> transactions;

  const StatisticScreen({super.key, required this.transactions});
  int getTotalPemasukan() {
    int total = 0;

    for (var item in transactions) {
      if (item.type == "Pemasukan") {
        total += item.amount;
      }
    }

    return total;
  }

  int getTotalPengeluaran() {
    int total = 0;

    for (var item in transactions) {
      if (item.type == "Pengeluaran") {
        total += item.amount;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistik"),

        backgroundColor: Colors.indigo,

        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Pengeluaran Bulan Ini",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 250,

                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: getTotalPemasukan().toDouble(),
                        color: Colors.green,
                        title: "Pemasukan",
                        radius: 80,
                      ),

                      PieChartSectionData(
                        value: getTotalPengeluaran().toDouble(),
                        color: Colors.red,
                        title: "Pengeluaran",
                        radius: 80,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Ringkasan",

                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              _buildItem(
                "Pemasukan",
                "Rp ${getTotalPemasukan()}",
                Colors.green,
              ),

              _buildItem(
                "Pengeluaran",
                "Rp ${getTotalPengeluaran()}",
                Colors.red,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          CircleAvatar(radius: 8, backgroundColor: color),

          const SizedBox(width: 10),

          Expanded(child: Text(title)),

          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
