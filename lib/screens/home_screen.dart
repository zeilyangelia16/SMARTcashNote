import 'package:flutter/material.dart';
import 'package:smartcashnote/screens/add_transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> transactions = [
    {"title": "Makan", "type": "Pengeluaran", "amount": 20000},
    {"title": "Gaji", "type": "Pemasukan", "amount": 500000},
  ];

  int getTotalSaldo() {
    int total = 0;

    for (var item in transactions) {
      if (item["type"] == "Pemasukan") {
        total += item["amount"] as int;
      } else {
        total -= item["amount"] as int;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart CashNote")),
      body: Column(
        children: [
          const SizedBox(height: 20),

          const Text("Total Saldo", style: TextStyle(fontSize: 18)),
          Text(
            "Rp ${getTotalSaldo()}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: transactions.map((item) {
                return ListTile(
                  title: Text(item["title"]),

                  subtitle: Text(item["type"]),

                  trailing: Text(
                    item["type"] == "Pemasukan"
                        ? "+${item["amount"]}"
                        : "-${item["amount"]}",
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) => const AddTransactionScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              transactions.add(result as Map<String, dynamic>);
            });
          }
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
