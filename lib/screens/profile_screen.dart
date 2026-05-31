import 'package:flutter/material.dart';
import 'edit_profil_screen.dart';
import '../services/session_service.dart';

class ProfileScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;
  final String currentName;
  final String currentEmail;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required this.currentName,
    required this.currentEmail,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String userName;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    userName = widget.currentName;
    userEmail = widget.currentEmail;
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

    final subTextColor = widget.isDarkMode ? Colors.white70 : Colors.grey[700];

    return Scaffold(
      backgroundColor: bgColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 70, bottom: 35),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF4338CA), Color(0xFF6366F1)],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 2,
                      ),
                    ),

                    child: const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.indigo),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    userEmail,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // MENU CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              padding: const EdgeInsets.symmetric(vertical: 10),

              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 14,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              child: Column(
                children: [
                  buildMenuTile(
                    icon: Icons.person_outline,
                    title: "Edit Profil",
                    textColor: textColor,
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            currentName: userName,
                            currentEmail: userEmail,
                          ),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          userName = result['name'];
                          userEmail = result['email'];
                        });
                      }
                    },
                  ),

                  buildDivider(),

                  buildMenuTile(
                    icon: Icons.security,
                    title: "Keamanan",
                    textColor: textColor,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: cardColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),

                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(24),

                            child: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Container(
                                  width: 50,
                                  height: 5,

                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                const CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Color(0xFFE0E7FF),

                                  child: Icon(
                                    Icons.security,
                                    color: Colors.indigo,
                                    size: 35,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Text(
                                  "Keamanan Data",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),

                                const SizedBox(height: 14),

                                Text(
                                  "Semua transaksi disimpan secara lokal menggunakan SQLite sehingga data tetap aman dan privat.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: subTextColor,
                                    height: 1.5,
                                  ),
                                ),

                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  buildDivider(),

                  buildMenuTile(
                    icon: Icons.help_outline,
                    title: "Bantuan",
                    textColor: textColor,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: cardColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),

                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(24),

                            child: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Container(
                                  width: 50,
                                  height: 5,

                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                const CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Color(0xFFE0E7FF),

                                  child: Icon(
                                    Icons.help_outline,
                                    color: Colors.indigo,
                                    size: 35,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Text(
                                  "Pusat Bantuan",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),

                                const SizedBox(height: 14),

                                ListTile(
                                  leading: const Icon(Icons.email_outlined),
                                  title: const Text("Email Support"),
                                  subtitle: const Text(
                                    "support@smartcashnote.com",
                                  ),
                                ),

                                ListTile(
                                  leading: const Icon(Icons.info_outline),
                                  title: const Text("Jam Bantuan"),
                                  subtitle: const Text("08.00 - 21.00"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  buildDivider(),

                  buildMenuTile(
                    icon: Icons.info_outline,
                    title: "Tentang Aplikasi",
                    textColor: textColor,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: cardColor,
                        isScrollControlled: true,

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),

                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(24),

                            child: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Container(
                                  width: 50,
                                  height: 5,

                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                const CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Color(0xFFE0E7FF),

                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Text(
                                  "SmartCashNote",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Text(
                                  "Aplikasi pencatatan keuangan modern untuk membantu pengguna mengelola pemasukan dan pengeluaran dengan mudah.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: subTextColor,
                                    height: 1.5,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                Text(
                                  "Version 1.0.0",
                                  style: TextStyle(color: subTextColor),
                                ),

                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  buildDivider(),

                  SwitchListTile(
                    value: widget.isDarkMode,

                    activeColor: Colors.indigo,

                    title: Text(
                      "Dark Mode",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    secondary: CircleAvatar(
                      backgroundColor: Colors.indigo.withOpacity(0.1),

                      child: Icon(
                        widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: Colors.indigo,
                      ),
                    ),

                    onChanged: (value) {
                      widget.toggleTheme();
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    elevation: 0,

                    padding: const EdgeInsets.symmetric(vertical: 16),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onPressed: () async {
                    await SessionService.clearSession();

                    if (!context.mounted) return;

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },

                  icon: const Icon(Icons.logout, color: Colors.white),

                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // VERSION
            Text(
              "SmartCashNote v1.0.0",
              style: TextStyle(color: subTextColor, fontSize: 13),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Colors.grey.withOpacity(0.2), height: 1),
    );
  }

  Widget buildMenuTile({
    required IconData icon,
    required String title,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),

      leading: CircleAvatar(
        backgroundColor: Colors.indigo.withOpacity(0.1),

        child: Icon(icon, color: Colors.indigo),
      ),

      title: Text(
        title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Colors.grey[500],
      ),

      onTap: onTap,
    );
  }
}
