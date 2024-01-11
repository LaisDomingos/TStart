import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/primeiraPergunta.dart';
import 'package:tstart/enviado.dart';

class P1 extends StatefulWidget {
  final int quantidadeTotal;
  final ajudante;
  final idCenario;
  final int vitimaAtual;
  P1({required this.quantidadeTotal, required this.ajudante, required this.idCenario, required this.vitimaAtual});
  @override
  State<P1> createState() => _P1();
}

class _P1 extends State<P1> {
  final Gestor Ref_Gestao = Gestor();
  @override
  void initState() {
    super.initState();

    // Adiciona um atraso de 2 segundos antes de navegar de volta para PrimeiraPergunta
    Future.delayed(Duration(seconds: 2), () {
      // Verifica se vitimaAtual é menor que quantidadeTotal
      if (widget.vitimaAtual < widget.quantidadeTotal) {
        int vitimaAtual = widget.vitimaAtual + 1;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PrimeiraPergunta(
              quantidadeTotal: widget.quantidadeTotal,
              ajudante: widget.ajudante,
              idCenario: widget.idCenario,
              vitimaAtual: vitimaAtual,
            ),
          ),
          
        );
        print(vitimaAtual);
      }  else {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Enviado(ajudante: widget.ajudante),
        ),
      );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    
    int TAM_ICON_PAGE_P0 = int.parse(Ref_Gestao.get_definicao("TAM_ICON_PAGE_P0"));
    int TAM_FONTSIZE_PAGE_P0 = int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_PAGE_P0")); 
    int WIDTH_P0 = int.parse(Ref_Gestao.get_definicao("WIDTH_P0"));
    int HEIGHT_P0= int.parse(Ref_Gestao.get_definicao("HEIGHT_P0"));

    return Scaffold(
      backgroundColor: Colors.red[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: WIDTH_P0.toDouble(),
              height: HEIGHT_P0.toDouble(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.person,
                size: TAM_ICON_PAGE_P0.toDouble(),
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              Ref_Gestao.get_definicao("TEXT_P1"),
              style: TextStyle(
                color: Colors.white,
                fontSize: TAM_FONTSIZE_PAGE_P0.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
