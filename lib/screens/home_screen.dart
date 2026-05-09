import 'package:flutter/material.dart';
import 'package:smartcashnote/screens/add_transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart CashNote")),
      body: Column(
        children: [
          const SizedBox(height: 20),

          const Text("Total Saldo", style: TextStyle(fontSize: 18)),
          const Text(
            "Rp 1.000.000",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("Makan"),
                  subtitle: Text("Pengeluaran"),
                  trailing: Text("-20.000"),
                ),
                ListTile(
                  title: Text("Gaji"),
                  subtitle: Text("Pemasukan"),
                  trailing: Text("+500.000"),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTransactionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
