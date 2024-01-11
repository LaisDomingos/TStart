import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/cenarios.dart';

class Enviado extends StatefulWidget {
  final ajudante;
  Enviado({required this.ajudante});
  @override
  State<Enviado> createState() => _Enviado();
}

class _Enviado extends State<Enviado> {
  final Gestor Ref_Gestao = Gestor();
   @override
  void initState() {
    super.initState();

    // Adiciona um atraso de 2 segundos antes de navegar de volta para PrimeiraPergunta
    Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Cenario(ajudante: widget.ajudante),
        ),
      );
  });
  }
  
  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    int SIZE_ICON_PAGE_ENVIADO = int.parse(Ref_Gestao.get_definicao("SIZE_ICON_PAGE_ENVIADO"));
    int FONTSIZE_PAGE_ENVIADO = int.parse(Ref_Gestao.get_definicao("FONTSIZE_PAGE_ENVIADO"));

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: SIZE_ICON_PAGE_ENVIADO.toDouble(),
            ),
            SizedBox(height: 20.0),
            Text(
              Ref_Gestao.get_definicao("ENVIADO_PAGE_ENVIADO"),
              style: TextStyle(
                color: Colors.white,
                fontSize: FONTSIZE_PAGE_ENVIADO.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
