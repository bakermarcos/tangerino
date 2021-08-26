import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:tangerino/dados.dart';
import 'package:tangerino/funcionariosAtivos.dart';
import 'package:tangerino/login.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Color(0xffff5f11),
    backgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffff5f11))))),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/home': (context) => MyApp(),
      '/funcionarios': (context) => FuncionariosPage()
    },));
}

final DadosRepository controller = DadosRepository();
_database() async {
  final json = await controller.fetch();
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var date = DateTime.now();
  

  @override
  void initState(){
    _database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //adicionar menu e botão de recarregar

      appBar: AppBar(title: Container(alignment: Alignment.center,
      child: Text('Home'),
      ),
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          Container(
            child: Text('${date.day}/${date.month}/${date.year}',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,),
          ),
          Padding(padding: EdgeInsets.all(10)),

          //Substituir container pelo gráfico

          Container(
            width: 200,
            height: 200,
            color: Color(0xffff9f21),
          ),
          Padding(padding: EdgeInsets.all(15)),

          //Colocar dados nos containers

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
                    width: 150,
                    height: 65,
                    
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '${json['comPresenca']}',
                            style: TextStyle(color: Colors.white,
                            fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('Pontos Registrados', style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
            Container(
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    width: 150,
                    height: 65,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'N°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('Sem presença', style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    width: 150,
                    height: 65,
                    child: Center(
                      child: Text('N° Pontos Abertos \n N° Pontos Fechados', style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/funcionarios');
                },
              child: Container(
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      width: 150,
                      height: 65,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'N°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text('Funcionários Ativos', style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    width: 150,
                    height: 65,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'N°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('Hora Extra', style: TextStyle(
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
            Container(
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue,
                    ),
                    width: 150,
                    height: 65,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'N°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text('Férias', style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
          )
        ],
      ),
      )
    );
  }
}

