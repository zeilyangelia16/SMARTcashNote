import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? const Color(0xFF0F111A) : Colors.grey[100];

    final cardColor = isDarkMode ? const Color(0xFF1A1D29) : Colors.white;

    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: textColor,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // FOTO PROFIL
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF4F46E5),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 16),

            Text(
              "Pengguna SmartCashNote",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "smartcashnote@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // MENU
            _buildMenu(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              onTap: toggleTheme,
              color: Colors.indigo,
              cardColor: cardColor,
              textColor: textColor,
            ),

            _buildMenu(
              icon: Icons.lock_outline,
              title: "Keamanan",
              onTap: () {},
              color: Colors.orange,
              cardColor: cardColor,
              textColor: textColor,
            ),

            _buildMenu(
              icon: Icons.help_outline,
              title: "Bantuan",
              onTap: () {},
              color: Colors.green,
              cardColor: cardColor,
              textColor: textColor,
            ),

            _buildMenu(
              icon: Icons.info_outline,
              title: "Tentang Aplikasi",
              onTap: () {},
              color: Colors.blue,
              cardColor: cardColor,
              textColor: textColor,
            ),

            _buildMenu(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {},
              color: Colors.red,
              cardColor: cardColor,
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color color,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),

          child: Icon(icon, color: color),
        ),

        title: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
