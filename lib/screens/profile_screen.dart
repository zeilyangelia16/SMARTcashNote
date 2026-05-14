import 'package:flutter/material.dart';
import 'package:smartcashnote/screens/edit_profil_screen.dart';
import 'package:smartcashnote/services/session_service.dart';

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
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Keamanan"),
                          content: const Text(
                            "Data transaksi tersimpan aman di SQLite lokal perangkat.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  buildDivider(),

                  buildMenuTile(
                    icon: Icons.help_outline,
                    title: "Bantuan",
                    textColor: textColor,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Hubungi support@smartcashnote.com"),
                        ),
                      );
                    },
                  ),

                  buildDivider(),

                  buildMenuTile(
                    icon: Icons.info_outline,
                    title: "Tentang Aplikasi",
                    textColor: textColor,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Tentang SmartCashNote"),
                          content: const Text(
                            "SmartCashNote adalah aplikasi pencatatan keuangan pribadi yang membantu Anda mengelola pemasukan dan pengeluaran dengan mudah. Data transaksi disimpan secara lokal di perangkat Anda menggunakan SQLite, sehingga aman dan dapat diakses kapan saja tanpa koneksi internet.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
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
