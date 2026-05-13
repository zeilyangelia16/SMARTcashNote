import 'package:flutter/material.dart';
import 'package:smartcashnote/models/transaction.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();

  String selectedType = "Pengeluaran";

  final TextEditingController noteController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String selectedCategory = "Makanan";

  final List<String> categories = [
    "Makanan",
    "Transport",
    "Belanja",
    "Tagihan",
    "Gaji",
    "Hiburan",
  ];

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
                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          "Detail Transaksi",

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // JUMLAH
                      TextFormField(
                        controller: amountController,

                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          hintText: "Masukkan jumlah uang",

                          prefixIcon: const Icon(
                            Icons.payments_outlined,
                            color: Color(0xFF4F46E5),
                          ),

                          prefixText: "Rp ",

                          filled: true,

                          fillColor: const Color(0xFFF5F7FB),

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                            borderSide: BorderSide.none,
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                            borderSide: const BorderSide(
                              color: Color(0xFF4F46E5),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukkan jumlah transaksi';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Masukkan angka yang valid';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // TANGGAL
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F7FB),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Color(0xFF4F46E5),
                              ),

                              const SizedBox(width: 12),

                              Text(
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",

                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // KATEGORI
                      DropdownButtonFormField<String>(
                        value: selectedCategory,

                        decoration: InputDecoration(
                          hintText: "Pilih kategori",

                          prefixIcon: const Icon(
                            Icons.category_outlined,
                            color: Color(0xFF4F46E5),
                          ),

                          filled: true,

                          fillColor: const Color(0xFFF5F7FB),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                            borderSide: BorderSide.none,
                          ),
                        ),

                        items: categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),

                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      // CATATAN
                      TextFormField(
                        controller: noteController,

                        maxLines: 3,

                        decoration: InputDecoration(
                          hintText: "Tambahkan catatan...",

                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(bottom: 60),
                            child: Icon(Icons.notes, color: Color(0xFF4F46E5)),
                          ),

                          filled: true,

                          fillColor: const Color(0xFFF5F7FB),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),

                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // PILIH TIPE TRANSAKSI
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedType = "Pemasukan";
                                });
                              },

                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),

                                padding: const EdgeInsets.symmetric(
                                  vertical: 22,
                                ),

                                decoration: BoxDecoration(
                                  color: selectedType == "Pemasukan"
                                      ? const Color(0xFFDCFCE7)
                                      : Colors.white,

                                  borderRadius: BorderRadius.circular(24),

                                  border: Border.all(
                                    color: selectedType == "Pemasukan"
                                        ? Colors.green
                                        : Colors.grey.shade300,

                                    width: 2,
                                  ),
                                ),

                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor:
                                          selectedType == "Pemasukan"
                                          ? Colors.green
                                          : Colors.green[100],

                                      child: Icon(
                                        Icons.arrow_downward,
                                        color: selectedType == "Pemasukan"
                                            ? Colors.white
                                            : Colors.green,
                                      ),
                                    ),

                                    const SizedBox(height: 14),

                                    Text(
                                      "Pemasukan",

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,

                                        color: selectedType == "Pemasukan"
                                            ? Colors.green[800]
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 18),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedType = "Pengeluaran";
                                });
                              },

                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),

                                padding: const EdgeInsets.symmetric(
                                  vertical: 22,
                                ),

                                decoration: BoxDecoration(
                                  color: selectedType == "Pengeluaran"
                                      ? const Color(0xFFFEE2E2)
                                      : Colors.white,

                                  borderRadius: BorderRadius.circular(24),

                                  border: Border.all(
                                    color: selectedType == "Pengeluaran"
                                        ? Colors.red
                                        : Colors.grey.shade300,

                                    width: 2,
                                  ),
                                ),

                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor:
                                          selectedType == "Pengeluaran"
                                          ? Colors.red
                                          : Colors.red[100],

                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: selectedType == "Pengeluaran"
                                            ? Colors.white
                                            : Colors.red,
                                      ),
                                    ),

                                    const SizedBox(height: 14),

                                    Text(
                                      "Pengeluaran",

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,

                                        color: selectedType == "Pengeluaran"
                                            ? Colors.red[800]
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // TOMBOL SIMPAN
                      SizedBox(
                        width: double.infinity,

                        height: 55,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),

                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final newTransaction = TransactionModel(
                                type: selectedType,
                                amount: int.parse(amountController.text),
                                category: selectedCategory,
                                note: noteController.text,
                                date:
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                              );

                              Navigator.pop(context, newTransaction);
                            }
                          },

                          child: const Text(
                            "Tambah Transaksi",

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
