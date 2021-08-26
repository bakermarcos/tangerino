import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

/*Future main() async{
  final json = await fetch();
  print(json['comPresenca']);
}

Future<Map> fetch() async{
  var url = Uri.parse('https://tangerino-resources-stg.s3.us-east-2.amazonaws.com/resources-web/desafio_mobile_estagio.json');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return json;
}*/


class DadosRepository {
  //final json = await fetch();
  //print(json['funcionariosAtivos']);

  Future<Map> fetch() async{
  var url = Uri.parse('https://tangerino-resources-stg.s3.us-east-2.amazonaws.com/resources-web/desafio_mobile_estagio.json');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return json;
  }
}

class Dados {
    Dados({
        required this.funcionariosAtivos,
        required this.comPresenca,
        required this.semPresenca,
        required this.pontoAberto,
        required this.pontoFechado,
        required this.emFerias,
        required this.comHoraExtra,
    });

    final List<FuncionariosAtivo> funcionariosAtivos;
    final int comPresenca;
    final int semPresenca;
    final int pontoAberto;
    final int pontoFechado;
    final int emFerias;
    final int comHoraExtra;

    factory Dados.fromJson(String str) => Dados.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dados.fromMap(Map<String, dynamic> json) => Dados(
        funcionariosAtivos: List<FuncionariosAtivo>.from(json["funcionariosAtivos"].map((x) => FuncionariosAtivo.fromMap(x))),
        comPresenca: json["comPresenca"],
        semPresenca: json["semPresenca"],
        pontoAberto: json["pontoAberto"],
        pontoFechado: json["pontoFechado"],
        emFerias: json["emFerias"],
        comHoraExtra: json["comHoraExtra"],
    );

    Map<String, dynamic> toMap() => {
        "funcionariosAtivos": List<dynamic>.from(funcionariosAtivos.map((x) => x.toMap())),
        "comPresenca": comPresenca,
        "semPresenca": semPresenca,
        "pontoAberto": pontoAberto,
        "pontoFechado": pontoFechado,
        "emFerias": emFerias,
        "comHoraExtra": comHoraExtra,
    };
}

class FuncionariosAtivo {
    FuncionariosAtivo({
        required this.codigo,
        required this.nome,
        required this.foto,
    });

    final int codigo;
    final String nome;
    final String foto;

    factory FuncionariosAtivo.fromJson(String str) => FuncionariosAtivo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FuncionariosAtivo.fromMap(Map<String, dynamic> json) => FuncionariosAtivo(
        codigo: json["codigo"],
        nome: json["nome"],
        foto: json["foto"],
    );

    Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "nome": nome,
        "foto": foto,
    };
}
