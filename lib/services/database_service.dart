import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartcashnote/models/transaction.dart';
import 'package:smartcashnote/models/user.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();

    return _database!;
  }

  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'smartcashnote.db');

    debugPrint('Opening SmartCashNote database: $path');

    return await openDatabase(
      path,
      version: 4,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await _createUserTable(db);
        await _createTransactionTable(db);
        await _initializeDefaultUser(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        debugPrint('Upgrading database from $oldVersion to $newVersion');
        if (oldVersion < 4) {
          await _ensureTransactionUserIdColumn(db);
        }
        await _createUserTable(db);
        await _createTransactionTable(db);
        if (oldVersion < 3) {
          await _initializeDefaultUser(db);
        }
      },
      onOpen: (db) async {
        // Pastikan tabel ada dan pengguna default tersedia setiap kali database dibuka.
        await _createTransactionTable(db);
        await _createUserTable(db);
        await _ensureTransactionUserIdColumn(db);
        await _initializeDefaultUser(db);
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  static Future<void> _createTransactionTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS transactions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL DEFAULT 1,
        type TEXT,
        amount INTEGER,
        category TEXT,
        note TEXT,
        date TEXT,
        FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
      )
    ''');
  }

  static Future<void> _createUserTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL DEFAULT 'Pengguna SmartCashNote',
        email TEXT NOT NULL DEFAULT 'smartcashnote@gmail.com'
      )
    ''');
  }

  static Future<void> _initializeDefaultUser(Database db) async {
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM users'),
    );
    if (count == 0) {
      await db.insert('users', {
        'name': 'Pengguna SmartCashNote',
        'email': 'smartcashnote@gmail.com',
      });
      debugPrint('DatabaseService._initializeDefaultUser created default user');
    }
  }

  static Future<bool> _transactionUserIdColumnExists(Database db) async {
    final List<Map<String, Object?>> tableInfo = await db.rawQuery(
      "PRAGMA table_info('transactions')",
    );
    return tableInfo.any((column) => column['name'] == 'user_id');
  }

  static Future<void> _ensureTransactionUserIdColumn(Database db) async {
    final exists = await _transactionUserIdColumnExists(db);
    if (!exists) {
      await db.execute(
        'ALTER TABLE transactions ADD COLUMN user_id INTEGER NOT NULL DEFAULT 1',
      );
      await db.execute(
        'UPDATE transactions SET user_id = 1 WHERE user_id IS NULL',
      );
    }
  }

  // INSERT
  static Future<void> insertTransaction(TransactionModel transaction) async {
    final db = await database;
    final values = Map<String, dynamic>.from(transaction.toMap());
    values.remove('id');

    try {
      if (values['user_id'] == null) {
        throw Exception('Transaction user_id is required');
      }
      final insertedId = await db.insert('transactions', values);
      debugPrint('DatabaseService.insertTransaction inserted id: $insertedId');
    } catch (e, stack) {
      debugPrint('DatabaseService.insertTransaction error: $e');
      debugPrint(stack.toString());
      rethrow;
    }
  }

  // GET ALL
  static Future<List<TransactionModel>> getTransactions({
    required int userId,
  }) async {
    final db = await database;

    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'transactions',
        where: 'user_id = ?',
        whereArgs: [userId],
        orderBy: 'id DESC',
      );
      debugPrint(
        'DatabaseService.getTransactions found ${maps.length} rows for user $userId',
      );
      return List.generate(maps.length, (index) {
        return TransactionModel.fromMap(maps[index]);
      });
    } catch (e, stack) {
      debugPrint('DatabaseService.getTransactions error: $e');
      debugPrint(stack.toString());
      return [];
    }
  }

  // DELETE
  static Future<void> deleteTransaction(int id) async {
    final db = await database;

    await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }

  // USER OPERATIONS
  static Future<UserModel?> getUserById(int id) async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );
      if (maps.isEmpty) return null;
      return UserModel.fromMap(maps.first);
    } catch (e, stack) {
      debugPrint('DatabaseService.getUserById error: $e');
      debugPrint(stack.toString());
      return null;
    }
  }

  static Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [email],
        limit: 1,
      );
      if (maps.isEmpty) return null;
      return UserModel.fromMap(maps.first);
    } catch (e, stack) {
      debugPrint('DatabaseService.getUserByEmail error: $e');
      debugPrint(stack.toString());
      return null;
    }
  }

  static Future<UserModel> createUser(String name, String email) async {
    final db = await database;
    final id = await db.insert('users', {'name': name, 'email': email});
    return UserModel(id: id, name: name, email: email);
  }

  static Future<int> updateUser(UserModel user) async {
    final db = await database;
    try {
      final updatedCount = await db.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
      debugPrint('DatabaseService.updateUser updated user: ${user.name}');
      return updatedCount;
    } catch (e, stack) {
      debugPrint('DatabaseService.updateUser error: $e');
      debugPrint(stack.toString());
      rethrow;
    }
  }

  // PROFILE STATISTICS
  static Future<int> getTotalTransactions({required int userId}) async {
    final db = await database;
    try {
      final result = Sqflite.firstIntValue(
        await db.rawQuery(
          'SELECT COUNT(*) FROM transactions WHERE user_id = ?',
          [userId],
        ),
      );
      return result ?? 0;
    } catch (e) {
      debugPrint('DatabaseService.getTotalTransactions error: $e');
      return 0;
    }
  }

  static Future<int> getTotalIncome({required int userId}) async {
    final db = await database;
    try {
      final result = Sqflite.firstIntValue(
        await db.rawQuery(
          'SELECT SUM(amount) FROM transactions WHERE type = ? AND user_id = ?',
          ['Pemasukan', userId],
        ),
      );
      return result ?? 0;
    } catch (e) {
      debugPrint('DatabaseService.getTotalIncome error: $e');
      return 0;
    }
  }

  static Future<int> getTotalExpense({required int userId}) async {
    final db = await database;
    try {
      final result = Sqflite.firstIntValue(
        await db.rawQuery(
          'SELECT SUM(amount) FROM transactions WHERE type = ? AND user_id = ?',
          ['Pengeluaran', userId],
        ),
      );
      return result ?? 0;
    } catch (e) {
      debugPrint('DatabaseService.getTotalExpense error: $e');
      return 0;
    }
  }

  static Future<Map<String, dynamic>> getProfileStats({
    required int userId,
  }) async {
    final totalTransactions = await getTotalTransactions(userId: userId);
    final totalIncome = await getTotalIncome(userId: userId);
    final totalExpense = await getTotalExpense(userId: userId);

    return {
      'totalTransactions': totalTransactions,
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
    };
  }

  static Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
      debugPrint('DatabaseService.closeDatabase closed database');
    }
  }

  static Future<void> resetDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'smartcashnote.db');
    await closeDatabase();
    await deleteDatabase(path);
    debugPrint('DatabaseService.resetDatabase deleted database at: $path');
    _database = null;
    await database;
  }
}
