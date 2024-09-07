import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/task_model.dart';


class DataBaseHelper {
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper dbInstance = DataBaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get getDatabase async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, 'myTodo.db');
    return await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Create table with fields for title, description, time, and imagePaths
  FutureOr<void> _onCreate(Database db, int version) {
    db.execute(
        """
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        time TEXT,
        imagePaths TEXT
      )
      """
    );
  }

  // Upgrade table if new fields are added in future versions
  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < 3) {
      db.execute("ALTER TABLE todos ADD COLUMN time TEXT;");
      db.execute("ALTER TABLE todos ADD COLUMN imagePaths TEXT;");
    }
  }

  // Insert a new todo
  Future<int> addTodos(TodoModel modelObj) async {
    Database db = await dbInstance.getDatabase;
    return await db.insert("todos", modelObj.toJson());
  }

  // Fetch all todos from the database
  Future<List<TodoModel>> getTodos() async {
    Database db = await dbInstance.getDatabase;
    var todos = await db.query('todos', orderBy: 'id');
    List<TodoModel> todoList = todos.isNotEmpty ? todos.map((e) => TodoModel.fromJson(e)).toList() : [];
    return todoList;
  }

  // Update an existing todo
  Future<int> updateTodo(TodoModel todo) async {
    Database db = await dbInstance.getDatabase;
    return await db.update(
      'todos',
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // Delete a todo by ID
  Future<int> deleteTodo(int id) async {
    Database db = await dbInstance.getDatabase;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
