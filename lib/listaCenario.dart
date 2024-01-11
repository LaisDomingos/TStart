import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/dbUser.dart';
import 'package:tstart/vitimasIdCenarios.dart';

class ListaCenarios extends StatefulWidget {
  final List<CenarioClass> listaCenarios;
  final ajudante;
  const ListaCenarios({Key? key, required this.listaCenarios, required this.ajudante}) : super(key: key);

  @override
  State<ListaCenarios> createState() => _ListaCenariosState();
}

class _ListaCenariosState extends State<ListaCenarios> {
  final Gestor Ref_Gestao = Gestor();

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();

    String OBS_PAGE_CENARIOS = Ref_Gestao.get_definicao("OBS_PAGE_CENARIOS");
    String QTD_VITIMAS_PAGE_CENARIOS =
        Ref_Gestao.get_definicao("QTD_VITIMAS_PAGE_CENARIOS");
    int TAM_FONTSIZE_LIST_PAGE_CENARIOS =
        int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_LIST_PAGE_CENARIOS"));
    int TAM_FONTSIZE_LIST_OBS_PAGE_CENARIOS = int.parse(
        Ref_Gestao.get_definicao("TAM_FONTSIZE_LIST_OBS_PAGE_CENARIOS"));
    int qtd  = widget.listaCenarios.length;
    print('qtd: $qtd');

    return ListView.builder(
      itemCount: widget.listaCenarios.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navegar para a próxima tela com o ID do cenário
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VitimasIdCenarios(idCenario: widget.listaCenarios[index].id, ajudante: widget.ajudante),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Parte vermelha com local, data e hora
                  Container(
                    color: Colors.red,
                    child: Row(
                      children: [
                        Text(
                          '${widget.listaCenarios[index].local}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: TAM_FONTSIZE_LIST_PAGE_CENARIOS.toDouble(),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '${widget.listaCenarios[index].data}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: TAM_FONTSIZE_LIST_PAGE_CENARIOS.toDouble(),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '${widget.listaCenarios[index].hora}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: TAM_FONTSIZE_LIST_PAGE_CENARIOS.toDouble(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Parte cinza claro com observação e quantidade de vítimas
                  Container(
                    color: Colors.grey[200], // Tom mais claro de cinza
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$OBS_PAGE_CENARIOS ${widget.listaCenarios[index].obs}',
                          style: TextStyle(
                            fontSize: TAM_FONTSIZE_LIST_OBS_PAGE_CENARIOS.toDouble(),
                          ),
                        ),
                        Text(
                          '$QTD_VITIMAS_PAGE_CENARIOS ${widget.listaCenarios[index].qtdVitima}',
                          style: TextStyle(
                            fontSize: TAM_FONTSIZE_LIST_OBS_PAGE_CENARIOS.toDouble(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}