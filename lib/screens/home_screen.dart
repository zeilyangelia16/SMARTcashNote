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

  List<Map<String, dynamic>> transactions = [];

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

  int getTotalPemasukan() {
    int total = 0;

    for (var item in transactions) {
      if (item["type"] == "Pemasukan") {
        total += item["amount"] as int;
      }
    }

    return total;
  }

  int getTotalPengeluaran() {
    int total = 0;

    for (var item in transactions) {
      if (item["type"] == "Pengeluaran") {
        total += item["amount"] as int;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isDarkMode
        ? const Color(0xFF0F111A)
        : Colors.grey[100];

    final cardColor = widget.isDarkMode
        ? const Color(0xFF1A1D29)
        : Colors.white;

    final textColor = widget.isDarkMode ? Colors.white : Colors.black;

    final subTextColor = widget.isDarkMode ? Colors.white70 : Colors.grey;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: textColor,
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
          color: bgColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              const Text(
                "CashNote",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F46E5),
                ),
              ),

              const SizedBox(height: 20),

              // WELCOME CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hai, Selamat Datang 👋",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Kelola keuanganmu dengan bijak",
                          style: TextStyle(color: subTextColor, fontSize: 16),
                        ),
                      ],
                    ),

                    const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.indigo,
                      size: 70,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // CARD SALDO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4338CA), Color(0xFF6366F1)],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Saldo Saat Ini",
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),

                        Icon(Icons.remove_red_eye, color: Colors.white),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Text(
                      "Rp ${getTotalSaldo()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Divider(color: Colors.white24),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        // PEMASUKAN
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green.withOpacity(0.2),
                                radius: 26,
                                child: const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.greenAccent,
                                ),
                              ),

                              const SizedBox(width: 14),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pemasukan",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "Rp ${getTotalPemasukan()}",
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(height: 60, width: 1, color: Colors.white24),

                        // PENGELUARAN
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red.withOpacity(0.2),
                                radius: 26,
                                child: const Icon(
                                  Icons.arrow_upward,
                                  color: Colors.redAccent,
                                ),
                              ),

                              const SizedBox(width: 14),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pengeluaran",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "Rp ${getTotalPengeluaran()}",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // RINGKASAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ringkasan Bulan Ini",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  Text("Lihat semua", style: TextStyle(color: Colors.indigo)),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFD1FAE5),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.green,
                            ),
                          ),

                          SizedBox(height: 20),

                          Text("Pemasukan", style: TextStyle(fontSize: 18)),

                          SizedBox(height: 10),

                          Text(
                            "Rp ${getTotalPemasukan()}",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFFEE2E2),
                            child: Icon(Icons.arrow_upward, color: Colors.red),
                          ),

                          SizedBox(height: 20),

                          Text("Pengeluaran", style: TextStyle(fontSize: 18)),

                          SizedBox(height: 10),

                          Text(
                            "Rp ${getTotalPengeluaran()}",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // TRANSAKSI TERBARU
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Transaksi Terbaru",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  Text("Lihat semua", style: TextStyle(color: Colors.indigo)),
                ],
              ),

              const SizedBox(height: 20),

              transactions.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          "Belum ada transaksi",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    )
                  : ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: transactions.map((item) {
                        return Card(
                          color: cardColor,
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: ListTile(
                            contentPadding: const EdgeInsets.all(14),

                            leading: CircleAvatar(
                              radius: 28,
                              backgroundColor: item["type"] == "Pemasukan"
                                  ? Colors.green[50]
                                  : Colors.red[50],

                              child: Icon(
                                item["type"] == "Pemasukan"
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,

                                color: item["type"] == "Pemasukan"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),

                            title: Text(
                              item["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            subtitle: Text(
                              item["type"],
                              style: TextStyle(color: subTextColor),
                            ),

                            trailing: Text(
                              item["type"] == "Pemasukan"
                                  ? "+ Rp ${item["amount"]}"
                                  : "- Rp ${item["amount"]}",

                              style: TextStyle(
                                color: item["type"] == "Pemasukan"
                                    ? Colors.green
                                    : Colors.red,

                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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
          Icon(
            icon,
            color: isSelected
                ? Colors.indigo
                : (widget.isDarkMode ? Colors.white70 : Colors.grey),
          ),

          Text(
            label,

            style: TextStyle(
              color: isSelected
                  ? Colors.indigo
                  : (widget.isDarkMode ? Colors.white70 : Colors.grey),

              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
