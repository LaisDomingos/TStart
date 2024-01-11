import 'package:flutter/material.dart';
import 'package:tstart/dbUser.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/primeiraPergunta.dart';
import 'package:tstart/main.dart';
import 'package:tstart/perfil.dart';

class NumeroVitimas extends StatefulWidget {
  const NumeroVitimas({Key? key, required this.ajudante, required this.local, required this.obs, required this.data, required this.hora});

  final ajudante;
  final local;
  final obs;
  final data;
  final hora;

  @override
  State<NumeroVitimas> createState() => _NumeroVitimas();
}

class _NumeroVitimas extends State<NumeroVitimas> {
  int quantidadeTotal = 0;
  final Gestor Ref_Gestao = Gestor();

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    int FONTSIZE_TEXT_NUM_VITIMAS_PAGE_NUM_VITIMAS =
        int.parse(Ref_Gestao.get_definicao("FONTSIZE_TEXT_NUM_VITIMAS_PAGE_NUM_VITIMAS"));
    int SIZE_ICON_PAGE_NUM_VITIMAS = int.parse(Ref_Gestao.get_definicao("SIZE_ICON_PAGE_NUM_VITIMAS"));
    int FONTSIZE_BTN_NUM_VITIMAS_PAGE_NUM_VITIMAS =
        int.parse(Ref_Gestao.get_definicao("FONTSIZE_BTN_NUM_VITIMAS_PAGE_NUM_VITIMAS"));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp(ajudante: ajudanteUserBD(),)),
            );
          },
        ),
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Ref_Gestao.get_definicao("TEXT_PAGE_NUM_VITIMAS"),
              style: TextStyle(
                fontSize: FONTSIZE_TEXT_NUM_VITIMAS_PAGE_NUM_VITIMAS.toDouble(),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Icon(
              Icons.people,
              size: SIZE_ICON_PAGE_NUM_VITIMAS.toDouble(),
              color: Colors.grey,
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  quantidadeTotal = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: Ref_Gestao.get_definicao("LABEL_NUM_PAGE_NUM_VITIMAS"),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                
                if (quantidadeTotal > 0) {
                  // Criar um objeto CenarioClass com os dados do cenário
                  CenarioClass novoCenario = CenarioClass(
                    local: widget.local,
                    data: widget.data,
                    hora: widget.hora,
                    obs: widget.obs,
                    qtdVitima: quantidadeTotal

                  );

                  // Salvar o cenário no banco de dados
                  await widget.ajudante.inserirCenario(novoCenario);   
                                
                  print("Id Cenario: $idCenario");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrimeiraPergunta(quantidadeTotal: quantidadeTotal, ajudante: widget.ajudante, idCenario: idCenario, vitimaAtual: 1,),
                    ),
                  );
                } else {
                  // Adicione um feedback ao usuário se a quantidade for 0
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(Ref_Gestao.get_definicao("ERROR_PAGE_NUM_VITIMAS")),
                        content: Text(Ref_Gestao.get_definicao("QTD_ZERO_PAGE_NUM_VITIMAS")),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(Ref_Gestao.get_definicao("OK_PAGE_NUM_VITIMAS")),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.green,
              ),
              child: Text(
                Ref_Gestao.get_definicao("BTN_BUTTON_PAGE_NUM_VITIMAS"),
                style: TextStyle(
                  fontSize: FONTSIZE_BTN_NUM_VITIMAS_PAGE_NUM_VITIMAS.toDouble(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}