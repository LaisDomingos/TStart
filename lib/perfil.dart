import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/loginPage.dart';
import 'package:tstart/dbUser.dart';
import 'package:tstart/registerPage.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key, required this.ajudante});

  final ajudante;

  @override
  State<PerfilPage> createState() => _PerfilPage();
}

class _PerfilPage extends State<PerfilPage> {
  final Gestor Ref_Gestao = Gestor();
  User? usuario;

  Future<void> buscarUsuario() async {
    usuario = await widget.ajudante.buscarUsuarioPorNome(nomeUser);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    buscarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();

    int TOP_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TOP_PAGE_2"));
    int RIGHT_PAGE_2 = int.parse(Ref_Gestao.get_definicao("RIGHT_PAGE_2"));
    int LEFT_PAGE_2 = int.parse(Ref_Gestao.get_definicao("LEFT_PAGE_2"));
    int WIDTH_PAGE_2 = int.parse(Ref_Gestao.get_definicao("WIDTH_PAGE_2"));
    int HEIGHT_PAGE_2 = int.parse(Ref_Gestao.get_definicao("HEIGHT_PAGE_2"));
    int TAM_TITLE_PAGE_PERFIL = int.parse(Ref_Gestao.get_definicao("TAM_TITLE_PAGE_PERFIL"));
    int FONTSIZE_TEXT_PAGE_PERFIL = int.parse(Ref_Gestao.get_definicao("FONTSIZE_TEXT_PAGE_PERFIL"));
    int TOP_PAGE_PERFIL = int.parse(Ref_Gestao.get_definicao("TOP_PAGE_PERFIL"));
    int LEFT_PAGE_PERFIL = int.parse(Ref_Gestao.get_definicao("LEFT_PAGE_PERFIL"));
    int RIGHT_PAGE_PERFIL = int.parse(Ref_Gestao.get_definicao("RIGHT_PAGE_PERFIL"));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Ref_Gestao.get_definicao("TITLE_PERFIL"),
          style: TextStyle(
            fontSize: TAM_TITLE_PAGE_PERFIL.toDouble(),
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: TOP_PAGE_2.toDouble(),
            left: RIGHT_PAGE_2.toDouble(),
            right: LEFT_PAGE_2.toDouble(),
            child: Center(
              child: Container(
                width: WIDTH_PAGE_2.toDouble(),
                height: HEIGHT_PAGE_2.toDouble(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset('img/user.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: TOP_PAGE_PERFIL.toDouble(),
            left: LEFT_PAGE_PERFIL.toDouble(),
            right: RIGHT_PAGE_PERFIL.toDouble(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Ref_Gestao.get_definicao("TEXT_ID_PAGE_PERFIL")} ${usuario?.id ?? "N/A"}',
                    style: TextStyle(
                      fontSize: FONTSIZE_TEXT_PAGE_PERFIL.toDouble(),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${Ref_Gestao.get_definicao("TEXT_NOME_PAGE_PERFIL")}  ${usuario?.nome ?? "N/A"}',
                    style: TextStyle(
                      fontSize: FONTSIZE_TEXT_PAGE_PERFIL.toDouble(),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${Ref_Gestao.get_definicao("TEXT_CARGO_PAGE_PERFIL")}  ${usuario?.cargo ?? "N/A"}',
                    style: TextStyle(
                      fontSize: FONTSIZE_TEXT_PAGE_PERFIL.toDouble(),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Adiciona o botão "Registrar Usuários" apenas se o cargo for "ADM"
          if (usuario?.cargo == Ref_Gestao.get_definicao("OP1_CARGO_PAGE_2")) 
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register(ajudante: widget.ajudante)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[400], // Cor de fundo amarela
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Borda circular de raio 8.0
                  ),
                ),
                child: Text(
                  Ref_Gestao.get_definicao("BTN_REGISTRAR_PAGE_PERFIL"),
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: FONTSIZE_TEXT_PAGE_PERFIL.toDouble()
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
