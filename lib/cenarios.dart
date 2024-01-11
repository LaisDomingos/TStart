import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/cenarioGeral.dart';
import 'package:tstart/main.dart';
import 'package:tstart/perfil.dart';
import 'package:tstart/dbUser.dart';
import 'package:tstart/listaCenario.dart';

class Cenario extends StatefulWidget {
  const Cenario({Key? key, required this.ajudante}) : super(key: key);

  final ajudante;

  @override
  State<Cenario> createState() => _CenarioState();
}

class _CenarioState extends State<Cenario> {
  final Gestor Ref_Gestao = Gestor();

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    
    int TAM_NOVO_CENARIO_PAGE_CENARIOS = int.parse(Ref_Gestao.get_definicao("TAM_NOVO_CENARIO_PAGE_CENARIOS"));
    int TAM_FONTSIZE_PAGE_CENARIOS = int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_PAGE_CENARIOS")); 
    int TAM_DIVIDER_PAGE_CENARIOS = int.parse(Ref_Gestao.get_definicao("TAM_DIVIDER_PAGE_CENARIOS")); 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp(ajudante: widget.ajudante,)),
            );
          },
          
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
             // Adicione a lógica para ir para a página de perfil
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PerfilPage(ajudante: widget.ajudante,)),
            );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Botão "Novo Cenário" com espaçamento
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height:  TAM_NOVO_CENARIO_PAGE_CENARIOS.toDouble(),
              color: Colors.yellow,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CenarioGeral(ajudante: widget.ajudante)),
                    );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      Ref_Gestao.get_definicao("TEXTO_NOVO_CENARIO_PAGE_CENARIOS"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: TAM_FONTSIZE_PAGE_CENARIOS.toDouble(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Divider após o botão "Novo Cenário"
          Divider(
            color: Colors.black,
            height: TAM_DIVIDER_PAGE_CENARIOS.toDouble(),
          ),
          // Lista de cenários
          Expanded(
            child: FutureBuilder<List<CenarioClass>>(
              // Carrega a lista de cenários do banco de dados
              future: widget.ajudante.buscarTodosCenarios(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro ao carregar cenários: ${snapshot.error}');
                } else {
                  // Exibe a lista de cenários usando o widget ListaCenarios
                  return ListaCenarios(listaCenarios: snapshot.data ?? [], ajudante: widget.ajudante);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
