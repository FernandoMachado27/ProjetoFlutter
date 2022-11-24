import 'package:projeto_a3_ironcar/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async { // classe onde pegamos ou criamos nosso bd
  final String path = join(await getDatabasesPath(), 'Cars.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1,);
}
