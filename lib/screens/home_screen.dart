import 'package:flutter/material.dart';
import 'package:smartcashnote/screens/add_transaction_screen.dart';
import 'package:smartcashnote/screens/statistic_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
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
      appBar: AppBar(
        title: const Text("Smart CashNote"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: const [
                        Text(
                          "Hai, Selamat Datang 👋",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text("Kelola keuanganmu dengan bijak"),
                      ],
                    ),

                    const Icon(
                      Icons.account_balance_wallet,
                      size: 50,
                      color: Colors.indigo,
                    ),
                  ],
                ),
              ),
            ),
            // CARD SALDO
            Container(
              margin: const EdgeInsets.all(16),

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius: BorderRadius.circular(20),

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Total Saldo",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Rp ${getTotalSaldo()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.green[100],

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          Icon(Icons.arrow_downward, color: Colors.green),

                          SizedBox(height: 10),

                          Text("Pemasukan"),

                          SizedBox(height: 5),

                          Text(
                            "Rp 5.000.000",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.red[100],

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          Icon(Icons.arrow_upward, color: Colors.red),

                          SizedBox(height: 10),

                          Text("Pengeluaran"),

                          SizedBox(height: 5),

                          Text(
                            "Rp 2.000.000",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // LIST TRANSAKSI
            Expanded(
              child: ListView(
                children: transactions.map((item) {
                  return Dismissible(
                    key: UniqueKey(),

                    background: Container(
                      color: Colors.red,

                      alignment: Alignment.centerRight,

                      padding: const EdgeInsets.only(right: 20),

                      child: const Icon(Icons.delete, color: Colors.white),
                    ),

                    onDismissed: (direction) {
                      setState(() {
                        transactions.remove(item);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${item["title"]} berhasil dihapus"),
                        ),
                      );
                    },

                    child: Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      elevation: 3,

                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: item["type"] == "Pemasukan"
                              ? Colors.green
                              : Colors.red,

                          child: Icon(
                            item["type"] == "Pemasukan"
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,

                            color: Colors.white,
                          ),
                        ),

                        title: Text(
                          item["title"],

                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        subtitle: Text(item["type"]),

                        trailing: Text(
                          item["type"] == "Pemasukan"
                              ? "+${item["amount"]}"
                              : "-${item["amount"]}",

                          style: TextStyle(
                            color: item["type"] == "Pemasukan"
                                ? Colors.green
                                : Colors.red,

                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),

        notchMargin: 10,

        child: SizedBox(
          height: 70,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              _buildNavItem(icon: Icons.home, label: "Home", index: 0),

              _buildNavItem(
                icon: Icons.receipt_long,
                label: "Transaksi",
                index: 1,
              ),

              const SizedBox(width: 40),

              _buildNavItem(
                icon: Icons.bar_chart,
                label: "Statistik",
                index: 2,
              ),

              _buildNavItem(icon: Icons.person, label: "Profil", index: 3),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

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

  Widget _buildNavItem({
    required IconData icon,

    required String label,

    required int index,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => const StatisticScreen()),
          );
        }
        setState(() {
          currentIndex = index;
        });
      },

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: isSelected ? Colors.indigo : Colors.grey),

          Text(
            label,

            style: TextStyle(
              color: isSelected ? Colors.indigo : Colors.grey,

              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
