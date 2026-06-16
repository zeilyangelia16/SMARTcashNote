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

  String formatCurrency(int amount) {
    final text = amount.toString();
    final reg = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp ${text.replaceAllMapped(reg, (match) => '.')}';
  }

  Widget _buildSummaryCard(String label, String amount, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
            const SizedBox(height: 10),
            Text(
              amount,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Statistik",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Statistik Transaksi",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 260,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: getTotalPemasukan().toDouble(),
                        color: Colors.green,
                        title: "Pemasukan",
                        radius: 90,
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      PieChartSectionData(
                        value: getTotalPengeluaran().toDouble(),
                        color: Colors.red,
                        title: "Pengeluaran",
                        radius: 90,
                        titleStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Builder(
                builder: (context) {
                  final pemasukan = getTotalPemasukan();
                  final pengeluaran = getTotalPengeluaran();
                  final saldo = pemasukan - pengeluaran;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ringkasan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildItem(
                        "Pemasukan",
                        formatCurrency(pemasukan),
                        Colors.green,
                      ),
                      _buildItem(
                        "Pengeluaran",
                        formatCurrency(pengeluaran),
                        Colors.red,
                      ),
                      _buildItem(
                        "Saldo",
                        formatCurrency(saldo),
                        saldo >= 0 ? Colors.green[700]! : Colors.red[700]!,
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
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
