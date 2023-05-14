import 'package:sqflite/sqflite.dart';
import 'package:todo_app/modules/models/task_model.dart';

class DatabaseConnection {
  static Database? database;
  static const String table = 'Tasks';
  static String? path;

  static Future<void> connect() async {
    String databasesPath = await getDatabasesPath();
    path = "$databasesPath/to_do.db";
    database = await openDatabase(
      path ?? '',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE $table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, isDone INTEGER)',
        );
        print("Database created");
      },
      onOpen: (Database db) {
        print("Database opend");
      },
    );
  }

  static Future<void> close() async {
    await database!.close();
  }

  static Future<void> deleteMyDatabase() async {
    await deleteDatabase(path ?? '');
  }

  static Future<void> insertToTasks(TaskModel task) async {
    await database!.insert(table, task.toJson());
  }

  static Future<void> updateTask(TaskModel task) async {
    await database!.update(
      table,
      task.toJson(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<void> deleteTask(int id) async {
    await database!.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<TaskModel>> getAllTasks() async {
    final List<Map<String, dynamic>> allRecords = await database!.query(table);
    final List<TaskModel> tasks = allRecords.map((record) {
      print(record);
      return TaskModel.fromJson(record);
    }).toList();

    return tasks;
  }

  static Future<TaskModel?> getTask(int id) async {
    List<Map<String, dynamic>> allResult = await database!.query(
      table,
      columns: ['id', 'name', 'description', 'isDone'],
      where: 'id = ?',
      whereArgs: [id],
    );
    if (allResult.isNotEmpty) {
      return TaskModel.fromJson(allResult.first);
    }
    return null;
  }
}
