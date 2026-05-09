import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

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
                        value: 40,
                        color: Colors.red,
                        title: "Makan",
                        radius: 80,
                      ),

                      PieChartSectionData(
                        value: 30,
                        color: Colors.blue,
                        title: "Transport",
                        radius: 80,
                      ),

                      PieChartSectionData(
                        value: 20,
                        color: Colors.green,
                        title: "Belanja",
                        radius: 80,
                      ),

                      PieChartSectionData(
                        value: 10,
                        color: Colors.orange,
                        title: "Lainnya",
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

              _buildItem("Makan", "Rp 500.000", Colors.red),

              _buildItem("Transport", "Rp 300.000", Colors.blue),

              _buildItem("Belanja", "Rp 250.000", Colors.green),

              _buildItem("Lainnya", "Rp 100.000", Colors.orange),

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
