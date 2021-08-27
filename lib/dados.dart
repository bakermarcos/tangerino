import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'dados.g.dart';

 /*Future main() async{
  final DadosRepository repository = DadosRepository();
  final json = await repository.fetch();
  print(json['comPresenca']);
}
*/
class DadosRepository {
  final dio = Dio();
  final url = 'https://tangerino-resources-stg.s3.us-east-2.amazonaws.com/resources-web/desafio_mobile_estagio.json';

  /*Future<Map> fetch() async {
    var url = Uri.parse(
        'https://tangerino-resources-stg.s3.us-east-2.amazonaws.com/resources-web/desafio_mobile_estagio.json');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return json;
  }*/

 Future fetchDados()async{
    final response = await dio.get(url);
    final list = response.data.toString() as List;
    List<Dados> dados = [];

    for (var json in list){
      final dado = _$DadosFromJson(json);
      dados.add(dado);
    }
    return dados;
  }
}

@JsonSerializable()
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

    //factory Dados.fromJson(String str) => Dados.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory Dados.fromJson(Map<String, dynamic> json) => _$DadosFromJson(json);

    Map<String, dynamic> toJson() => _$DadosToJson(this);

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
