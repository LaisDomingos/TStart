import 'package:flutter/material.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/dbUser.dart';
import 'package:tstart/p0.dart';
import 'package:tstart/p1.dart';
import 'package:tstart/p2.dart';
import 'package:tstart/p3.dart';

class ObsGeraisVitimas extends StatefulWidget {
  final int quantidadeTotal;
  final ajudante;
  final estado;
  final idCenario;
  final int vitimaAtual;
  ObsGeraisVitimas({required this.quantidadeTotal, required this.ajudante, required this.estado, required this.idCenario, required this.vitimaAtual});

  @override
  _ObsGeraisVitimasState createState() => _ObsGeraisVitimasState();
}

class _ObsGeraisVitimasState extends State<ObsGeraisVitimas> {
  final Gestor Ref_Gestao = Gestor();
  List<String> sintomasSelecionados = [];
  String observacao = "";
  String nome = "";
  int idade = 0;
  String sexo = "";
  List<String> sintomasObservacoes = [];

  void _mostrarSinaisSintomasModal() {
    Ref_Gestao.load();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.red, // Fundo vermelho
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min, // Defina o tamanho principal como mínimo
            children: [
              Text(
                Ref_Gestao.get_definicao("BTN_SINAIS_SINTOMAS_PAGE_OBS"),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _toggleSintoma(Ref_Gestao.get_definicao("BTN_HEMORRAGIA_PAGE_SINAIS_SINTOMAS"));
                },
                style: _getButtonStyle(Ref_Gestao.get_definicao("BTN_HEMORRAGIA_PAGE_SINAIS_SINTOMAS")),
                child: Text(Ref_Gestao.get_definicao("BTN_HEMORRAGIA_PAGE_SINAIS_SINTOMAS")),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  _toggleSintoma(Ref_Gestao.get_definicao("BTN_DESMAIO_PAGE_SINAIS_SINTOMAS"));
                },
                style: _getButtonStyle(Ref_Gestao.get_definicao("BTN_DESMAIO_PAGE_SINAIS_SINTOMAS")),
                child: Text(Ref_Gestao.get_definicao("BTN_DESMAIO_PAGE_SINAIS_SINTOMAS")),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  _toggleSintoma(Ref_Gestao.get_definicao("BTN_FRATURA_PAGE_SINAIS_SINTOMAS"));
                },
                style: _getButtonStyle(Ref_Gestao.get_definicao("BTN_FRATURA_PAGE_SINAIS_SINTOMAS")),
                child: Text(Ref_Gestao.get_definicao("BTN_FRATURA_PAGE_SINAIS_SINTOMAS")),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  _toggleSintoma(Ref_Gestao.get_definicao("BTN_DIFICUL_RESPIRAR_PAGE_SINAIS_SINTOMAS"));
                },
                style: _getButtonStyle(Ref_Gestao.get_definicao("BTN_DIFICUL_RESPIRAR_PAGE_SINAIS_SINTOMAS")),
                child: Text(Ref_Gestao.get_definicao("BTN_DIFICUL_RESPIRAR_PAGE_SINAIS_SINTOMAS")),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _concluirSinaisSintomas();
                },
                child: Text(Ref_Gestao.get_definicao("BTN_CONCLUIR_PAGE_OBS")),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleSintoma(String sintoma) {
    setState(() {
      if (sintomasSelecionados.contains(sintoma)) {
        sintomasSelecionados.remove(sintoma);
      } else {
        sintomasSelecionados.add(sintoma);
      }
    });
  }

  ButtonStyle _getButtonStyle(String sintoma) {
    Color backgroundColor = sintomasSelecionados.contains(sintoma) ? Color.fromARGB(255, 119, 241, 160) : Colors.white;

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  void _concluirSinaisSintomas() {
    // Adiciona os sintomas à lista específica
    sintomasObservacoes.addAll(sintomasSelecionados);
    // Limpa a lista de sintomas selecionados
    sintomasSelecionados.clear();
    Navigator.pop(context); // Fecha a modal
  }

  void _vitimas(String estado) {
    print('Estado: $estado');
    if(estado == 'P0'){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => P0(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual),
        ),
      );
    } else if(estado == 'P1'){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => P1(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual),
        ),
      );
    } else if(estado == 'P2'){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => P2(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual),
        ),
      );
    } else if(estado == 'P3'){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => P3(quantidadeTotal: widget.quantidadeTotal, ajudante: widget.ajudante, idCenario: widget.idCenario, vitimaAtual: widget.vitimaAtual),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    int SIZE_ICON_PAGE_SINAIS_SINTOMAS = int.parse(Ref_Gestao.get_definicao("SIZE_ICON_PAGE_SINAIS_SINTOMAS"));
    String OBS_APP_BAR_PAGE_SINAIS_SINTOMAS = Ref_Gestao.get_definicao("OBS_APP_BAR_PAGE_SINAIS_SINTOMAS");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('$OBS_APP_BAR_PAGE_SINAIS_SINTOMAS ${widget.vitimaAtual}/${widget.quantidadeTotal}'),
      ),
      body: Container(
        color: Colors.red, // Fundo vermelho
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Icon de perfil
                Icon(
                  Icons.person,
                  size: SIZE_ICON_PAGE_SINAIS_SINTOMAS.toDouble(),
                  color: Colors.white,
                ),
                SizedBox(height: 16.0),

                // Textfield de observação
                TextField(
                  onChanged: (value) {
                    observacao = value;
                  },
                  decoration: InputDecoration(
                    hintText: Ref_Gestao.get_definicao("OBSERVACOES_PAGE_OBS"),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),

                // Botões masc e fem
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sexo = Ref_Gestao.get_definicao("BTN_MASC_PAGE_OBS");
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(Ref_Gestao.get_definicao("BTN_MASC_PAGE_OBS")),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sexo = Ref_Gestao.get_definicao("BTN_FEM_PAGE_OBS");
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(Ref_Gestao.get_definicao("BTN_FEM_PAGE_OBS")),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),

                // Textfield com nome
                TextField(
                  onChanged: (value) {
                    nome = value;
                  },
                  decoration: InputDecoration(
                    hintText: Ref_Gestao.get_definicao("LABEL_NOME_PAGE_OBS"),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),

                // Textfield com idade
                TextField(
                  onChanged: (value) {
                try {
                  idade = int.parse(value);
                } catch (e) { 
                  print('Inseriu letras');
                }
                },
                decoration: InputDecoration(
                  hintText: Ref_Gestao.get_definicao("LABEL_IDADE_PAGE_OBS"),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

                SizedBox(height: 16.0),

                // Botões sinais e sintomas
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _mostrarSinaisSintomasModal();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(Ref_Gestao.get_definicao("BTN_SINAIS_SINTOMAS_PAGE_OBS")),
                    ),
                  ],
                ),

                SizedBox(height: 16.0),

                // Botão concluir
                ElevatedButton(
                  onPressed: () async {
                    int id_Cenario = widget.idCenario;
                    String estado = widget.estado;
                    // Lógica para processar as observações
                    print('Observação: $observacao');
                    print('Nome: $nome');
                    print('Idade: $idade');
                    print('Sexo: $sexo');
                    print('Sintomas: $sintomasObservacoes');
                    print('Estado: $estado');
                    print('Id_Cenario: $id_Cenario');

                    Vitima novaVitima = Vitima(
                      estado: estado,
                      nome: nome,
                      idade: idade,
                      sinaisSintomas: sintomasObservacoes,
                      obs: observacao,
                      cenarioId: id_Cenario,
                    );

                    // Agora, você precisa chamar o método inserirVitima para adicionar a vítima ao banco de dados
                    widget.ajudante.inserirVitima(novaVitima);

                    _vitimas(estado);
                    
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text(
                    Ref_Gestao.get_definicao("BTN_CONCLUIR_PAGE_OBS"),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
