import 'package:flutter/material.dart';
import 'package:tstart/dbUser.dart';
import 'package:tstart/gestor.dart';

String mensagemErroRegister = '';

class Register extends StatefulWidget {
  const Register({Key? key, required this.ajudante});

  final ajudante;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Gestor Ref_Gestao = Gestor();

  final nomeController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedCargo; // Variável para armazenar o cargo selecionado

  late User user;

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();

    int TAM_TITLE_PAGE_3 =
        int.parse(Ref_Gestao.get_definicao("TAM_TITLE_PAGE_3"));
    int TAM_FONTSIZE_ERRO_PAGE_3 =
        int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_ERRO_PAGE_3"));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Ref_Gestao.get_definicao("LABEL_TITLE_PAGE_3"),
          style: TextStyle(
            fontSize: TAM_TITLE_PAGE_3.toDouble(),
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nomeController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Ref_Gestao.get_definicao("LABEL_TEXT_NOME_PAGE_3"),
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
                  labelText: Ref_Gestao.get_definicao("LABEL_TEXT_PASS_PAGE_3"),
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
              DropdownButtonFormField<String>(
                value: selectedCargo,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCargo = newValue;
                  });
                },
                items: <String>[
                  Ref_Gestao.get_definicao("OP1_CARGO_PAGE_2"),
                  Ref_Gestao.get_definicao("OP2_CARGO_PAGE_2"),
                  Ref_Gestao.get_definicao("OP3_CARGO_PAGE_2"),
                  Ref_Gestao.get_definicao("OP4_CARGO_PAGE_2"),
                  //Ref_Gestao.get_definicao("OP5_CARGO_PAGE_2"),
                  //Ref_Gestao.get_definicao("OP6_CARGO_PAGE_2"),
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Ref_Gestao.get_definicao("LABEL_TEXT_CARGO_PAGE_3"),
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
                mensagemErroRegister,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TAM_FONTSIZE_ERRO_PAGE_3.toDouble(),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // mensagemErro = '';
                  });

                  // Chamar a função de login
                  registrar(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  Ref_Gestao.get_definicao("BOTAO_REGISTRAR_PAGE_2"),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registrar(BuildContext context) {
    String nome = nomeController.text;
    String password = passwordController.text;

    // Verifica se os campos não estão vazios
    if (nome.isNotEmpty && password.isNotEmpty && selectedCargo != null) {
      // Campos não estão vazios, continue com o registro

      // Imprime os dados para verificação
      print('Nome: $nome');
      print('Password: $password');
      print('Cargo: $selectedCargo');

      user = User(
        nome: nome,
        password: password,
        cargo: selectedCargo!,
        id: null,
      );

      widget.ajudante.inserirUser(user);

      // Navega de volta para a página de login
      // Navigator.pop(context);
    } else {
      // Um ou mais campos estão vazios, trate isso conforme necessário
      print('Os campos não podem estar vazios');
      mensagemErroRegister =
          Ref_Gestao.get_definicao("TEXT_CAMPO_VAZIO_PAGE_2");
      // Ou exiba uma mensagem de erro para o usuário, etc.
    }
  }
}
