import 'dados.dart';

class HomeController {
  List<Dados> dados = [];
  final repository = DadosRepository();
  Future start()async{
    dados = await repository.fetchDados();
  }
}