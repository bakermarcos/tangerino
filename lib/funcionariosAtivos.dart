import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dados.dart';

class FuncionariosPage extends StatefulWidget {
  const FuncionariosPage({Key? key}) : super(key: key);

  @override
  _FuncionariosPageState createState() => _FuncionariosPageState();
}

class _FuncionariosPageState extends State<FuncionariosPage> {
  //final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topLeft,
          child: Text('Funcionários ativos'),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: 4,
          itemBuilder: (context, index) {
            return _funcionarioCard(context, index);
          }),
    );
  }

  Widget _funcionarioCard(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              'images/logo.svg',
              height: MediaQuery.of(context).size.height * 0.01,
              color: Color(0xffff5f11),
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'nome',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'status',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.024,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
