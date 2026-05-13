import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smartcashnote/models/transaction.dart';

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
      version: 2,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await _createTransactionTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        debugPrint('Upgrading database from $oldVersion to $newVersion');
        await _createTransactionTable(db);
      },
      onOpen: (db) async {
        // Pastikan tabel ada setiap kali database dibuka.
        await _createTransactionTable(db);
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }

  static Future<void> _createTransactionTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS transactions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT,
        amount INTEGER,
        category TEXT,
        note TEXT,
        date TEXT
      )
    ''');
  }

  // INSERT
  static Future<void> insertTransaction(TransactionModel transaction) async {
    final db = await database;
    final values = Map<String, dynamic>.from(transaction.toMap());
    values.remove('id');

    try {
      final insertedId = await db.insert('transactions', values);
      debugPrint('DatabaseService.insertTransaction inserted id: $insertedId');
    } catch (e, stack) {
      debugPrint('DatabaseService.insertTransaction error: $e');
      debugPrint(stack.toString());
      rethrow;
    }
  }

  // GET ALL
  static Future<List<TransactionModel>> getTransactions() async {
    final db = await database;

    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'transactions',
        orderBy: 'id DESC',
      );
      debugPrint('DatabaseService.getTransactions found ${maps.length} rows');
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
