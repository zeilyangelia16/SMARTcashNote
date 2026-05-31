import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';
import 'statistic_screen.dart';
import 'all_transaction_screen.dart';
import 'profile_screen.dart';
import '../models/transaction.dart';
import '../models/user.dart';
import '../services/database_service.dart';
import '../services/session_service.dart';

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

  bool isBalanceVisible = true;

  List<TransactionModel> transactions = [];

  int? userId;
  String userName = "Pengguna SmartCashNote";
  String userEmail = "smartcashnote@gmail.com";

  @override
  void initState() {
    super.initState();
    _initializeSession();
  }

  Future<void> _initializeSession() async {
    final session = await SessionService.getSession();
    if (session.hasValidSession) {
      final currentUser =
          await DatabaseService.getUserById(session.userId) ??
          UserModel(
            id: session.userId,
            name: session.userName,
            email: session.userEmail,
          );
      if (!mounted) return;
      setState(() {
        userId = session.userId;
        userName = currentUser.name;
        userEmail = currentUser.email;
      });
      await fetchTransactions();
    }
  }

  Future<void> fetchTransactions() async {
    if (userId == null) return;

    final data = await DatabaseService.getTransactions(userId: userId!);

    print(data.length);

    setState(() {
      transactions = data;
    });
  }

  Future<void> fetchUser() async {
    if (userId == null) return;

    final user = await DatabaseService.getUserById(userId!);
    if (user != null) {
      setState(() {
        userName = user.name;
        userEmail = user.email;
      });
    }
  }

  int getTotalSaldo() {
    int total = 0;

    for (var item in transactions) {
      if (item.type == "Pemasukan") {
        total += item.amount;
      } else {
        total -= item.amount;
      }
    }

    return total;
  }

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
        title: const Text(
          "CashNote",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF4F46E5),
          ),
        ),

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
              // WELCOME CARD
              Container(
                padding: const EdgeInsets.all(12),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hai, Selamat Datang 👋",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "Kelola keuanganmu dengan bijak",
                            style: TextStyle(color: subTextColor, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.indigo,
                      size: 38,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // CARD SALDO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF4338CA), Color(0xFF6366F1)],
                  ),

                  borderRadius: BorderRadius.circular(22),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.18),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Saldo Saat Ini",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isBalanceVisible = !isBalanceVisible;
                            });
                          },

                          child: Icon(
                            isBalanceVisible
                                ? Icons.visibility
                                : Icons.visibility_off,

                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      isBalanceVisible ? "Rp ${getTotalSaldo()}" : "Rp •••••••",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Divider(color: Colors.white24),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // PEMASUKAN
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pemasukan",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      isBalanceVisible
                                          ? "Rp ${getTotalPemasukan()}"
                                          : "Rp •••••",
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(height: 60, width: 1, color: Colors.white24),

                        const SizedBox(width: 14),

                        // PENGELUARAN
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pengeluaran",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      isBalanceVisible
                                          ? "Rp ${getTotalPengeluaran()}"
                                          : "Rp •••••",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // RINGKASAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ringkasan Bulan Ini",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StatisticScreen(transactions: transactions),
                        ),
                      );
                    },

                    child: const Text(
                      "Lihat semua",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFFD1FAE5),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.green,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text("Pemasukan", style: TextStyle(fontSize: 14)),

                          SizedBox(height: 4),

                          Text(
                            "Rp ${getTotalPemasukan()}",
                            style: TextStyle(
                              fontSize: 18,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFFFEE2E2),
                            child: Icon(Icons.arrow_upward, color: Colors.red),
                          ),

                          SizedBox(height: 8),

                          Text("Pengeluaran", style: TextStyle(fontSize: 14)),

                          SizedBox(height: 4),

                          Text(
                            "Rp ${getTotalPengeluaran()}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // TRANSAKSI TERBARU
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaksi Terbaru",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllTransactionScreen(transactions: transactions),
                        ),
                      );
                    },

                    child: const Text(
                      "Lihat semua",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

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
                      children: transactions.take(3).map((item) {
                        return Dismissible(
                          key: UniqueKey(),

                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),

                          onDismissed: (direction) async {
                            await DatabaseService.deleteTransaction(item.id!);

                            fetchTransactions();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${item.category} berhasil dihapus",
                                ),
                              ),
                            );
                          },

                          child: Card(
                            color: cardColor,
                            elevation: 0,
                            margin: const EdgeInsets.only(bottom: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),

                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: item.type == "Pemasukan"
                                    ? Colors.green[50]
                                    : Colors.red[50],

                                child: Icon(
                                  item.type == "Pemasukan"
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,

                                  color: item.type == "Pemasukan"
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),

                              title: Text(
                                item.category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              subtitle: Text(
                                item.type,
                                style: TextStyle(color: subTextColor),
                              ),

                              trailing: Text(
                                item.type == "Pemasukan"
                                    ? "+ Rp ${item.amount}"
                                    : "- Rp ${item.amount}",

                                style: TextStyle(
                                  color: item.type == "Pemasukan"
                                      ? Colors.green
                                      : Colors.red,

                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
              if (transactions.length > 4)
                Padding(
                  padding: const EdgeInsets.only(top: 10),

                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllTransactionScreen(
                              transactions: transactions,
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        "Transaksi lainnya>>>",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),

        notchMargin: 2,
        elevation: 8,

        child: SizedBox(
          height: 60,

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

      floatingActionButton: SizedBox(
        width: 52,
        height: 52,
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,

              MaterialPageRoute(
                builder: (context) => const AddTransactionScreen(),
              ),
            );

            if (result != null && userId != null) {
              print(result);
              final newTransaction = result as TransactionModel;
              final transactionWithUser = TransactionModel(
                id: newTransaction.id,
                userId: userId,
                type: newTransaction.type,
                amount: newTransaction.amount,
                category: newTransaction.category,
                note: newTransaction.note,
                date: newTransaction.date,
              );

              print("MASUK KE SQLITE");

              await DatabaseService.insertTransaction(transactionWithUser);

              print("BERHASIL DISIMPAN");

              fetchTransactions();
            }
          },

          child: const Icon(Icons.add),
        ),
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
        if (index == 1) {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  AllTransactionScreen(transactions: transactions),
            ),
          );
        }

        if (index == 2) {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) => StatisticScreen(transactions: transactions),
            ),
          );
        }

        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(
                isDarkMode: widget.isDarkMode,
                toggleTheme: widget.toggleTheme,
                currentName: userName,
                currentEmail: userEmail,
              ),
            ),
          ).then((_) {
            fetchUser();
          });
        }

        setState(() {
          currentIndex = index;
        });
      },

      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 26,
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
      ),
    );
  }
}
