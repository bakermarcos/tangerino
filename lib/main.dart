import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:tangerino/dados.dart';
import 'package:tangerino/funcionariosAtivos.dart';
import 'package:tangerino/login.dart';

import 'homeController.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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

/*_database() async{
  final DadosRepository repository = DadosRepository();
  final json = await repository.fetch();
  return json;
}*/

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var date = DateTime.now();
  //final controller = HomeController();
  //final json = _database();

  @override
  void initState() {
    super.initState();
    //controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Container(alignment: Alignment.center,
      child: Text('Home'),
      ),
      backgroundColor: Color(0xffff9f21),
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

          Container(
            width: 200,
            height: 200,
            color: Colors.indigo[100],
          ),
          Padding(padding: EdgeInsets.all(15)),

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
                            'N°',
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

