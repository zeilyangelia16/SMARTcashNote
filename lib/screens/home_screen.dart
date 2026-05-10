import 'package:flutter/material.dart';
import 'package:smartcashnote/screens/add_transaction_screen.dart';
import 'package:smartcashnote/screens/statistic_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  final bool isDarkMode;

  const HomeScreen({
    super.key,

    required this.toggleTheme,

    required this.isDarkMode,
  });

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
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        scrolledUnderElevation: 0,

        actions: [
          IconButton(
            onPressed: widget.toggleTheme,

            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // JUDUL APP
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "CashNote",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F46E5),
                  ),
                ),
              ),

              // CARD WELCOME
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(14),
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

              // PEMASUKAN & PENGELUARAN
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

              const SizedBox(height: 25),

              // JUDUL TRANSAKSI
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Transaksi Terbaru",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    Text("Lihat semua", style: TextStyle(color: Colors.indigo)),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // LIST TRANSAKSI
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                children: transactions.map((item) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

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

                      title: Text(item["title"]),

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
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 100),
            ],
          ),
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
