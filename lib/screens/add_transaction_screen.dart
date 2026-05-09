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
      appBar: AppBar(
        title: const Text("Tambah Transaksi"),

        centerTitle: true,

        backgroundColor: Colors.transparent,

        elevation: 0,

        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                // ICON
                Container(
                  width: 90,
                  height: 90,

                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
                    ),

                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: const Icon(
                    Icons.account_balance_wallet,

                    color: Colors.white,

                    size: 45,
                  ),
                ),

                const SizedBox(height: 30),

                // CARD FORM
                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(25),

                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),

                  child: Column(
                    children: [
                      // NAMA TRANSAKSI
                      TextFormField(
                        controller: titleController,

                        decoration: InputDecoration(
                          labelText: "Nama Transaksi",

                          prefixIcon: const Icon(Icons.edit),

                          filled: true,

                          fillColor: Colors.grey[100],

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),

                            borderSide: BorderSide.none,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama transaksi wajib diisi";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // JUMLAH
                      TextFormField(
                        controller: amountController,

                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          labelText: "Jumlah",

                          prefixIcon: const Icon(Icons.money),

                          filled: true,

                          fillColor: Colors.grey[100],

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),

                            borderSide: BorderSide.none,
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Jumlah wajib diisi";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // DROPDOWN
                      DropdownButtonFormField<String>(
                        value: selectedType,

                        decoration: InputDecoration(
                          labelText: "Kategori",

                          prefixIcon: const Icon(Icons.category),

                          filled: true,

                          fillColor: Colors.grey[100],

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),

                            borderSide: BorderSide.none,
                          ),
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

                      const SizedBox(height: 30),

                      // TOMBOL SIMPAN
                      SizedBox(
                        width: double.infinity,

                        height: 55,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),

                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );

                              Navigator.pop(context, {
                                "title": titleController.text,

                                "type": selectedType,

                                "amount": int.parse(amountController.text),
                              });
                            }
                          },

                          child: const Text(
                            "Simpan Transaksi",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
