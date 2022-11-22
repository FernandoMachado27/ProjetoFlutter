import 'package:projeto_a3_ironcar/components/task.dart';

class TaskDao {
  // responsavel pela comunicação com bd
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_insurance INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'ironcarTable';
  static const String _name = 'name';
  static const String _insurance = 'insurance';
  static const String _image = 'image';

  save(Task car) async {}
  Future<List<Task>> findAll() async {}
  Future<List<Task>> find(String nomeDoCarro) async{}
  delete(String nomeDoCarro) async{}
}
