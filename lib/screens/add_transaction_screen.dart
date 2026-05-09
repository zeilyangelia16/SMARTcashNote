import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleControler = TextEditingController();

  final TextEditingController amounControlet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Transaksi")),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: titleControler,
                decoration: const InputDecoration(
                  labelText: "NamaTransaksi",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama Transaksi wajib diisi";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: amounControlet,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Jumlah ",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Jumlah wajib diisi";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text("Simpan")),
            ],
          ),
        ),
      ),
    );
  }
}
