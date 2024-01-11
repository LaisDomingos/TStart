import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({Key? key, required this.ajudante, required this.codigo});

  final ajudante;
  final codigo;

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenha();
}

class _EsqueceuSenha extends State<EsqueceuSenha> {
  final Gestor Ref_Gestao = Gestor();

  final idController = TextEditingController();
  final codigoController = TextEditingController();
  final passwordController = TextEditingController();
  String mensagemErro = '';

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();

    int TAM_FONTSIZE_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TAM_SIZEDBOX_PAGE_2"));
    int TAM_FONTSIZE_ERRO_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_ERRO_PAGE_2"));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          // Primeira camada: Fundo vermelho
          Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
          
          // Terceira camada: Conteúdo do formulário de login
          Positioned(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: idController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: Ref_Gestao.get_definicao("LABEL_TEXT_ID_PAGE_SENHA"),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: codigoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: Ref_Gestao.get_definicao("LABEL_CODIGO_PASS_PAGE_SENHA"),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: Ref_Gestao.get_definicao("LABEL_TEXT_PASS_NOVA_PAGE_SENHA"),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      mensagemErro,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TAM_FONTSIZE_ERRO_PAGE_2.toDouble(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                      });

                      AlterarSenha();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        Ref_Gestao.get_definicao("BTN_ALTERAR_SENHA_PAGE_SENHA"),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: TAM_FONTSIZE_PAGE_2.toDouble(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void AlterarSenha() async {
  // Obter os valores dos controladores
  String id = idController.text;
  String codigo = codigoController.text;
  String novaSenha = passwordController.text;

  // Verificar se os campos não estão vazios
  if (id.isNotEmpty && codigo.isNotEmpty && novaSenha.isNotEmpty) {
    // Obter o ID do usuário do banco de dados
    int userId = int.parse(id);

    // Comparar o código inserido com o código armazenado
    if (codigo == widget.codigo) {
      // Atualizar a senha do usuário no banco de dados
      await widget.ajudante.atualizarSenhaUsuario(userId, novaSenha);

      mensagemErro = Ref_Gestao.get_definicao("SENHA_ALTERADA_PAGE_SENHA");
    } else {
      mensagemErro = Ref_Gestao.get_definicao("CODIGO_INCORRETO_PAGE_SENHA");
    }
  } else {
    // Um ou ambos os campos estão vazios
    mensagemErro = Ref_Gestao.get_definicao("TEXT_CAMPO_VAZIO_PAGE_2");
  }

  setState(() {
    // Atualizar a UI com a mensagem de erro
  });
}

 
}
