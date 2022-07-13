import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  late Database database;

  TaskDatabase() {
    init();
  }

  void init() async {
    var databasesPath = await getDatabasesPath();
    String path = '${databasesPath}demo.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)',
        );
      },
    );
  }

  void insert(String title) async {
    await database.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES("$title", 1234, 456.789)',
    );
  }

  void update() async {
    int count = await database.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name'],
    );
    print('updated: $count');
  }

  void select() async {
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    print(list);
  }

  void delete() async {
    await database.rawDelete(
      'DELETE FROM Test WHERE name = ?',
      ['another name'],
    );
  }

  void closeDatabase() async {
    await database.close();
  }
}
