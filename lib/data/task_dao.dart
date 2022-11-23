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

  save(Task car) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExist = await find(car.nome);
    Map<String, dynamic> carMap = toMap(car);
    if (itemExist.isEmpty) {
      print('O cliente não existia');
      return await bancoDeDados.insert(_tablename, carMap);
    } else {
      print('O cliente já existia');
      return await bancoDeDados.update(
        _tablename,
        carMap,
        where: '$_name = ?',
        whereArgs: [car.nome],
      );
    }
  } // salvar

  Map<String, dynamic> toMap(Task car) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> mapaDeCarros = Map();
    mapaDeCarros[_name] = car.nome;
    mapaDeCarros[_insurance] = car.seguro;
    mapaDeCarros[_insurance] = car.foto;
    print('Mapa de carros: $mapaDeCarros');
    return mapaDeCarros;
  } // tabelinha

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no Banco de Dados. Encontrado: $result');
    return toList(result);
  } // busca elementos, lista de carros

  List<Task> toList(List<Map<String, dynamic>> mapaDeCarros) {
    print('Convertendo to List:');
    final List<Task> cars = [];
    for (Map<String, dynamic> linha in mapaDeCarros) {
      final Task car = Task(linha[_name], linha[_image], linha[_insurance]);
      cars.add(car);
    }
    print('Lista de Carros $cars');
    return cars;
  } // pega o mapa do bd e vira lista

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
  } // procurar especifico

  delete(String nomeDoCliente) async {
    print('Deletando cliente: $nomeDoCliente');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDoCliente],
    );
  } // deletar
}
