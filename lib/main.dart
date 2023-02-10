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
        debugShowCheckedModeBanner: false,
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/02.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 77),
                child: const CircleAvatar(
                  backgroundColor: Color(0xF81F7F3),
                  child: Image(
                    width: 35,
                    height: 35,
                    image: AssetImage(
                      'assets/image/01.jpeg',
                    ),
                  ),
                ),
                width: 170.0,
                height: 170.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 93),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 16,
                      right: 16,
                      bottom: 4,
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                          ),
                        ]),
                    child: TextFormField(
                      controller: controllerUser,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    margin: const EdgeInsets.only(
                      top: 32,
                    ),
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 16,
                      right: 16,
                      bottom: 4,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: controlePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Password'),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 6,
                        right: 32,
                      ),
                      child: Text(
                        'Atualizar Senha',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Acesso',
                    ),
                  )
                ]),
              ),
            ],
          ),
        )));
  }
}
