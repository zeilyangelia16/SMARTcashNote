class UserModel {
  final int? id;
  final String name;
  final String email;

  UserModel({this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {'name': name, 'email': email};
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      name: map['name'] ?? 'Pengguna SmartCashNote',
      email: map['email'] ?? 'smartcashnote@gmail.com',
    );
  }
}
