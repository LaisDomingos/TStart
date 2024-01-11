import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/perfil.dart';
import 'package:tstart/dbUser.dart';

class VitimasIdCenarios extends StatefulWidget {
  const VitimasIdCenarios({Key? key, required this.idCenario, required this.ajudante});
  final ajudante;
  final idCenario;

  @override
  State<VitimasIdCenarios> createState() => _VitimasIdCenariosState();
}

class _VitimasIdCenariosState extends State<VitimasIdCenarios> {
  final Gestor Ref_Gestao = Gestor();

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    int ID_CENARIO_FONTSIZE_PAGE_LISTA_VITIMAS = int.parse(Ref_Gestao.get_definicao("ID_CENARIO_FONTSIZE_PAGE_LISTA_VITIMAS"));
    // Adapte conforme necessário
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('${widget.idCenario}',
          style: TextStyle(
            color: Colors.white,
            fontSize: ID_CENARIO_FONTSIZE_PAGE_LISTA_VITIMAS.toDouble(),
          ),),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilPage(ajudante: widget.ajudante,)),
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Vitima>>(
        // Carrega a lista de vítimas do banco de dados para o cenário específico
        future: widget.ajudante.buscarVitimasPorCenario(widget.idCenario),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar vítimas: ${snapshot.error}');
          } else {
            // Exibe a lista de vítimas usando o widget ListaVitimas
            return ListaVitimas(listaVitimas: snapshot.data ?? []);
          }
        },
      ),
    );
  }
}

class ListaVitimas extends StatefulWidget {
  final List<Vitima> listaVitimas;

  const ListaVitimas({Key? key, required this.listaVitimas}) : super(key: key);

  @override
  State<ListaVitimas> createState() => _ListaVitimasState();
}

class _ListaVitimasState extends State<ListaVitimas> {
  final Gestor Ref_Gestao = Gestor();

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    String ANOS_PAGE_LISTA_VITIMAS = Ref_Gestao.get_definicao("ANOS_PAGE_LISTA_VITIMAS");
    int ESTADO_FONTSIZE_PAGE_LISTA_VITIMAS = int.parse(Ref_Gestao.get_definicao("ESTADO_FONTSIZE_PAGE_LISTA_VITIMAS"));
    int INFO_FONTSIZE_PAGE_LISTA_VITIMAS = int.parse(Ref_Gestao.get_definicao("INFO_FONTSIZE_PAGE_LISTA_VITIMAS"));

    Color _getColorForState(String estado) {
      switch (estado) {
        case 'P0':
          return Colors.black;
        case 'P1':
          return Colors.red;
        case 'P2':
          return Colors.yellow;
        case 'P3':
          return Colors.green;
        default:
          return Colors.black;
      }
    }

    return ListView.builder(
      itemCount: widget.listaVitimas.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Estado no topo à esquerda
                Container(
                  color: _getColorForState(widget.listaVitimas[index].estado),
                  child: Row(
                    children: [
                      Text(
                        '${widget.listaVitimas[index].estado}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ESTADO_FONTSIZE_PAGE_LISTA_VITIMAS.toDouble(),
                        ),
                      ),
                      Spacer(), // Adiciona um espaçador flexível
                      Icon(
                        Icons.info,
                        color: Colors.white, // Define a cor do ícone como branca
                      ),
                    ],
                  ),
                ),
                // Ícone de perfil abaixo
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 8.0),
                    // Nome, sexo, idade, obs
                    Text(
                      '${widget.listaVitimas[index].nome} | ${widget.listaVitimas[index].idade} $ANOS_PAGE_LISTA_VITIMAS | ${widget.listaVitimas[index].obs}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: INFO_FONTSIZE_PAGE_LISTA_VITIMAS.toDouble(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
