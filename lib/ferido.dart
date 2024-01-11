import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/obsGeraisVitimas.dart';

class Ferido extends StatefulWidget {
  final int quantidadeTotal;
  final ajudante;
  final fr;
  final fc;
  final idCenario;
  final int vitimaAtual;
  Ferido({required this.quantidadeTotal, required this.ajudante, required this.fr, required this.fc, required this.idCenario, required this.vitimaAtual});

  @override
  State<Ferido> createState() => _Ferido();
}

class _Ferido extends State<Ferido> {
  final Gestor Ref_Gestao = Gestor();
  String estado = ''; // Variable to store the estado
  String ferido = '';

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
                    Ref_Gestao.get_definicao("PERGUNTA_TRES"),
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
                            ferido = Ref_Gestao.get_definicao("BTN_SIM");
                            estado = calcularEstado(widget.fr, widget.fc, ferido);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ObsGeraisVitimas(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante,estado: estado, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual),
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
                          setState(() {
                            ferido = Ref_Gestao.get_definicao("BTN_NAO");
                            estado = calcularEstado(widget.fr, widget.fc, ferido);
                          });
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ObsGeraisVitimas(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante,estado: estado, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual),
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

  String calcularEstado(String fr, String fc, String ferido) {
  if (fr == Ref_Gestao.get_definicao("BTN_MENOR_RESPIRA_FR_PAGE_PERGUNTAS") &&
      fc == Ref_Gestao.get_definicao("BTN_MENOR_CARDIACA_FC_PAGE_PERGUNTAS")) {
      if(ferido == Ref_Gestao.get_definicao("BTN_SIM")){
        return Ref_Gestao.get_definicao("TEXT_P2_ESTADO");
      } else{
        return Ref_Gestao.get_definicao("TEXT_P3_ESTADO");
      }
  } else if (fr == Ref_Gestao.get_definicao("BTN_MENOR_RESPIRA_FR_PAGE_PERGUNTAS") &&
      fc == Ref_Gestao.get_definicao("BTN_MAIOR_CARDIACA_FC_PAGE_PERGUNTAS")) {
    if(ferido == Ref_Gestao.get_definicao("BTN_SIM")){
        return Ref_Gestao.get_definicao("TEXT_P1_ESTADO");
      } else{
        return Ref_Gestao.get_definicao("TEXT_P2_ESTADO");
      }
  } else if (fr == Ref_Gestao.get_definicao("BTN_MAIOR_RESPIRA_FR_PAGE_PERGUNTAS") &&
      fc == Ref_Gestao.get_definicao("BTN_MENOR_CARDIACA_FC_PAGE_PERGUNTAS")) {
    if(ferido == Ref_Gestao.get_definicao("BTN_SIM")){
        return Ref_Gestao.get_definicao("TEXT_P1_ESTADO");
      } else{
        return Ref_Gestao.get_definicao("TEXT_P2_ESTADO");
      }
  } else if (fr == Ref_Gestao.get_definicao("BTN_MAIOR_RESPIRA_FR_PAGE_PERGUNTAS") &&
      fc == Ref_Gestao.get_definicao("BTN_MAIOR_CARDIACA_FC_PAGE_PERGUNTAS")) {
    return Ref_Gestao.get_definicao("TEXT_P1_ESTADO");
  } 

  // Add a default return statement to handle other cases or return a default value
  return '';
}

}
