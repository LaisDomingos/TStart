import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/frequenciaRespiratoria.dart'; 
import 'package:tstart/obsGeraisVitimas.dart';

class PrimeiraPergunta extends StatefulWidget {
  final int quantidadeTotal;
  final ajudante;
  final idCenario;
  final int vitimaAtual;
  PrimeiraPergunta({required this.quantidadeTotal, required this.ajudante, required this.idCenario, required this.vitimaAtual });

  @override
  State<PrimeiraPergunta> createState() => _PrimeiraPerguntaState();
}

class _PrimeiraPerguntaState extends State<PrimeiraPergunta> {
  final Gestor Ref_Gestao = Gestor();

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
                    Ref_Gestao.get_definicao("PERGUNTA_UM"),
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
                        onPressed:  () {
                          // Lógica para o botão "NÃO"
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FrequenciaRespiratoria(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual)), 
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
                          Ref_Gestao.get_definicao("BTN_SIM"),
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Lógica para o botão "NÃO"
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ObsGeraisVitimas(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante,estado: Ref_Gestao.get_definicao("TEXT_P0_ESTADO"), idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual), // Navega para a página P0
                            ),
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
                          Ref_Gestao.get_definicao("BTN_NAO"),
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