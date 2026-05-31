import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/database_service.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;

  const EditProfileScreen({
    super.key,
    required this.currentName,
    required this.currentEmail,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.currentName);

    emailController = TextEditingController(text: widget.currentEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profil")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,

              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () async {
                  UserModel user = UserModel(
                    id: 1,
                    name: nameController.text,
                    email: emailController.text,
                  );

                  await DatabaseService.updateUser(user);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profil berhasil diperbarui")),
                  );

                  Navigator.pop(context, {
                    'name': nameController.text,
                    'email': emailController.text,
                  });
                },

                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
