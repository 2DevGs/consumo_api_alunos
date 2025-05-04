import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/aluno.dart';

class AlunoRepository {

  Future<List<dynamic>> buscarTodos() async {
    final alunosResponse = 
        await http.get(Uri.parse('http://localhost:8080/alunos'));

    final alunosList = jsonDecode(alunosResponse.body);
    final todosAlunos = alunosList.map<Aluno>((alunoMap)  {
      return Aluno.fromMap(alunoMap);
    }).toList();
    return todosAlunos;
    // também poderia ser abreviado assim
    // return alunosList.map<Aluno>((alunoMap) =>  Aluno.fromMap(alunoMap)).toList();

  }

  Future<Aluno> buscarPorId(int id) async {
    final alunosResponse = 
        await http.get(Uri.parse('http://localhost:8080/alunos/$id'));
  return Aluno.fromJson(alunosResponse.body);
  }


}