import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/ferido.dart';
//import 'package:tstart/primeiraPergunta.dart';

class FrequenciaCardiaca extends StatefulWidget {
  final int quantidadeTotal;
  final ajudante;
  final fr;
  final idCenario;
  final int vitimaAtual;
  FrequenciaCardiaca({required this.quantidadeTotal, required this.ajudante, required this.fr, required this.idCenario, required this.vitimaAtual});

  @override
  State<FrequenciaCardiaca> createState() => _FrequenciaCardiaca();
}

class _FrequenciaCardiaca extends State<FrequenciaCardiaca> {
  final Gestor Ref_Gestao = Gestor();
  String fc = ''; // Variável para armazenar a resposta

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    int FONTSIZE_PERGUNTAS = int.parse(Ref_Gestao.get_definicao("FONTSIZE_PERGUNTAS"));
    int FONTSIZE_QUANTIDADE = int.parse(Ref_Gestao.get_definicao("FONTSIZE_QUANTIDADE"));
    
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(    
                child: Text(
                  '${widget.vitimaAtual}/${widget.quantidadeTotal}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: FONTSIZE_QUANTIDADE.toDouble(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Ref_Gestao.get_definicao("RESPIRA_FC_PAGE_PERGUNTAS"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FONTSIZE_PERGUNTAS.toDouble(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para o botão "SIM"
                          setState(() {
                            fc = Ref_Gestao.get_definicao("BTN_MENOR_CARDIACA_FC_PAGE_PERGUNTAS");
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Ferido(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, fr: widget.fr, fc: fc, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual)), // Navega para a página P0
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          Ref_Gestao.get_definicao("BTN_MENOR_CARDIACA_FC_PAGE_PERGUNTAS"),
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para o botão "NÃO"
                          setState(() {
                            fc = Ref_Gestao.get_definicao("BTN_MAIOR_CARDIACA_FC_PAGE_PERGUNTAS");
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Ferido(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, fr: widget.fr, fc: fc, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual)), // Navega para a página P0
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          Ref_Gestao.get_definicao("BTN_MAIOR_CARDIACA_FC_PAGE_PERGUNTAS"),
                          style: TextStyle(
                            color: Colors.red[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
