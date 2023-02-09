import 'dart:convert';

import 'package:estoqueita/page/power_page.dart';
import 'package:estoqueita/page/vendedores.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: <String, WidgetBuilder>{
          '/powerPage': (BuildContext context) => const PowerPage(),
          '/vendedores': (BuildContext context) => const Vendedores(),
          '/login': (BuildContext context) => const LoginPage(),
        });
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controlePassword = TextEditingController();

  String mensagem = '';

  Future<List> login() async {
    final response = await http.post(
        "http://192.168.0.103/estoque/login.php" as Uri,
        body: {"usuario": controllerUser.text, "senha": controlePassword.text});

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        mensagem = 'Usuario ou senha inválida';
      });
    } else {
      Navigator.pushReplacementNamed(context, '/powerPage');
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/02.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}
