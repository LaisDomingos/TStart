import 'package:flutter/material.dart';
import 'package:tstart/loginPage.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/dbUser.dart';

void main() {
  runApp(MaterialApp(home: MyApp(ajudante: ajudanteUserBD())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.ajudante}) : super(key: key);

  final ajudante;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  /*void initState() {
    super.initState();
    widget.ajudante.criarBD();
  }*/
  
  void initState() {
    super.initState();
    widget.ajudante.connectToMySql(); 
  }

  final Gestor Ref_Gestao = Gestor();

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();

    String pageTitle = Ref_Gestao.get_definicao("TITULO_PAGE_1");

    return MaterialApp(
      title: 'T.START',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: MyHomePage(title: pageTitle, ajudante: widget.ajudante),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.ajudante}) : super(key: key);

  final String title;
  final ajudante;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage(ajudante: widget.ajudante)),
          );
        },
        child: Container(
          color: Colors.red,
          child: Center(
            child: Image.asset('img/logo1.png'),
          ),
        ),
      ),
    );
  }
}
