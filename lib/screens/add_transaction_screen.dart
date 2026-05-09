import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  String selectedType = "Pengeluaran";

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
                controller: titleController,
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
                controller: amountController,
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
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedType,

                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(
                    value: "Pemasukan",
                    child: Text("Pemasukan"),
                  ),

                  DropdownMenuItem(
                    value: "Pengeluaran",
                    child: Text("Pengeluaran"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String title = titleController.text;

                    String amount = amountController.text;

                    await Future.delayed(const Duration(seconds: 1));

                    Navigator.pop(context, {
                      "title": title,
                      "type": selectedType,
                      "amount": int.parse(amount),
                    });
                  }
                },

                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
