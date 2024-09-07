import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../controllers/home_controller.dart';
import '../model/task_model.dart';


class DataBaseHelper {
  HomeController controller = HomeController();
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper dbInstance = DataBaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get getDatabase async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, 'myTodo.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute(
        """
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        date TEXT,
        imagePaths TEXT
      )
      """
    );
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < 2) {
      db.execute("ALTER TABLE todos ADD COLUMN date TEXT;");
      db.execute("ALTER TABLE todos ADD COLUMN imagePaths TEXT;");
    }
  }


  Future<int> addTodos(TodoModel modelObj) async {
    Database db = await dbInstance.getDatabase;
    return await db.insert("todos", modelObj.toJson());
  }


  Future<List<TodoModel>> getTodos() async {
    Database db = await dbInstance.getDatabase;
    var todos = await db.query('todos', orderBy: 'id');

    List<TodoModel> todoList = todos.isNotEmpty
        ? todos.map((modelObj) => TodoModel.fromJson(modelObj)).toList()
        : [];

    return todoList;
  }

  // Delete
  Future deleteTodo(int id) async {
    Database db = await dbInstance.getDatabase;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // Update
  Future updateTodo(TodoModel todo) async {
    Database db = await dbInstance.getDatabase;
    return await db.update(
      'todos',
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
