import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dados.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('images/logo_completa.svg',
            height: MediaQuery.of(context).size.height * 0.11,
            color: Color(0xffff5f11),
            fit: BoxFit.contain,
            ),
            Padding(padding: EdgeInsets.all(30)),
            TextField(
              onChanged: (text){
                email = text;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder()
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (text) {
                senha = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder()),
            ),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
              onPressed: (){
                //'LukeEuSouOSeuPai'
                if(email == 'marcos.baker@tangerino.com' && senha == '123'){
                  Navigator.of(context).pushReplacementNamed('/home');
                }else{
                  print('voce e um ze');
                }
              },
              child: Text('Entrar'))
          ],
        ),
          ),
      ));
  }
}