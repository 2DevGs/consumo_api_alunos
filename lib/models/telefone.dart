import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd, 
    required this.telefone
  });


  // metodo que pega o nosso objeto Telefone e transforma em um objeto Mpa<String, dynamic>
  // toMap()

  //Passo 1 da serialização
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }


  // metodo que pega um Map<String, dynamic> e transforma em um json Pelo pacote dart:convert (jsonEconde)
  // toJson

  // Passo 2 da serializacão
  String toJson() => jsonEncode(toMap()); 
  

  // Passo 2 da deserialização
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0, 
      telefone: map['telefone'] ?? '',
    );
  }

  // Passo 1 da deserialização
  // factory Telefone.fromJson(String json) {
  //   final jsonMap = jsonDecode(json);
  //   return Telefone.fromMap(jsonMap);
  // }
  //também pode ser escrito assim
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));
  

}