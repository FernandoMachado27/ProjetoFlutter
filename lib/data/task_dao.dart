import 'package:projeto_a3_ironcar/components/task.dart';
import 'package:projeto_a3_ironcar/data/database.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no Banco de Dados. Encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeCarros) {
    print('Convertendo to List:');
    final List<Task> cars = [];
    for (Map<String, dynamic> linha in mapaDeCarros) {
      final Task car = Task(linha[_name], linha[_image], linha[_insurance]);
      cars.add(car);
    }
    print('Lista de Carros $cars');
    return cars;
  }

  Future<List<Task>> find(String nomeDoCliente) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDoCliente],
    );
    print('Cliente encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDoCarro) async {}
}
