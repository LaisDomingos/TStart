import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/cenarios.dart';
import 'package:tstart/esqueceuSenha.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.ajudante});
  
  final ajudante;

  @override
  State<LoginPage> createState() => _LoginPageState();
}
String nomeUser = '';
class _LoginPageState extends State<LoginPage> {

  final Gestor Ref_Gestao = Gestor();

  final nomeController = TextEditingController();
  final passwordController = TextEditingController();
  String mensagemErro = '';
  
  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();

  int TOP_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TOP_PAGE_2"));
  int RIGHT_PAGE_2 = int.parse(Ref_Gestao.get_definicao("RIGHT_PAGE_2"));
  int LEFT_PAGE_2 = int.parse(Ref_Gestao.get_definicao("LEFT_PAGE_2"));
  int WIDTH_PAGE_2 = int.parse(Ref_Gestao.get_definicao("WIDTH_PAGE_2"));
  int HEIGHT_PAGE_2 = int.parse(Ref_Gestao.get_definicao("HEIGHT_PAGE_2"));
  int TAM_FONTSIZE_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TAM_SIZEDBOX_PAGE_2")); 
  int TAM_FONTSIZE_ERRO_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_ERRO_PAGE_2"));
  
    return Scaffold(
      body: Stack(
        children: [
          // Primeira camada: Fundo vermelho
          Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
          // Segunda camada: Imagem em um círculo
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
          // Terceira camada: Conteúdo do formulário de login
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nomeController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Ref_Gestao.get_definicao("LABEL_TEXT_NOME_PAGE_2"),  
                      filled: true, 
                        fillColor: Colors.white, 
                        labelStyle: TextStyle(color: Colors.grey), 
                        enabledBorder: OutlineInputBorder( 
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder( // Borda quando o campo está focado
                          borderSide: BorderSide(color: Colors.white),
                        ),                   
                  )
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: Ref_Gestao.get_definicao("LABEL_TEXT_PASS_PAGE_2"),
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
                TextButton(
                onPressed: () {
                  var codigo = (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();
                  print("código: $codigo");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(Ref_Gestao.get_definicao("TEXT_POPUP_CODIGO_PAGE_2"),
                        style: TextStyle(        
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                        content: Text(codigo,
                        style: TextStyle(        
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),                  
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => EsqueceuSenha(ajudante: widget.ajudante, codigo: codigo)),
                              );
                            },
                            child: Text(Ref_Gestao.get_definicao("OK_PAGE_NUM_VITIMAS")),
                          ),
                        ],
                      );
                    },
                  );
                  
                  
                },
                child: Text(
                  Ref_Gestao.get_definicao("ESQUECER_SENHA_PAGE_2"),
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                ),
                Text(
                mensagemErro,
                style: TextStyle(
                color: Colors.white,
                fontSize: TAM_FONTSIZE_ERRO_PAGE_2.toDouble(),),
              ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                  });

                  Login();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), 
                    ),
                  ),
                  child: Text(
                    Ref_Gestao.get_definicao("BOTAO_ENTRAR_PAGE_2"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: TAM_FONTSIZE_PAGE_2.toDouble(), 
                    ),
                  ),
                )


              ],
            ),
          ),
        ],
      ),
    );
  }

  void Login() async {
  // Obtenha os valores dos controladores
  
  String nome = nomeController.text;
  String senha = passwordController.text;

  // Verifique se os campos não estão vazios
  if (nome.isNotEmpty && senha.isNotEmpty) {
    // Os campos não estão vazios, continue com a verificação de credenciais
    bool credenciaisValidas = await widget.ajudante.verificarCredenciais(nome, senha);

    if (credenciaisValidas) {
      nomeUser=nome;
      // Credenciais válidas, navegue para a próxima tela (Cenario)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Cenario(ajudante: widget.ajudante,)),
      );
    } else {
      // Credenciais inválidas, você pode tratar isso de acordo com sua lógica
      print('Credenciais inválidas');
      mensagemErro = Ref_Gestao.get_definicao("TEXT_CREDENCIAIS_ERROR_PAGE_2");
      // Ou exibir uma mensagem de erro para o usuário, etc.
    }
  } else {
    // Um ou ambos os campos estão vazios, trate isso conforme necessário
    print('Os campos não podem estar vazios');
    // Ou exiba uma mensagem de erro para o usuário, etc.
    mensagemErro = Ref_Gestao.get_definicao("TEXT_CAMPO_VAZIO_PAGE_2");
  }
  }

}
