import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tstart/gestor.dart';
import 'package:tstart/numeroVitimas.dart';

class CenarioGeral extends StatefulWidget {
  const CenarioGeral({Key? key, required this.ajudante}) : super(key: key);

  final ajudante;

  @override
  State<CenarioGeral> createState() => _CenarioGeralState();
}


class _CenarioGeralState extends State<CenarioGeral> {
  bool get wantKeepAlive => true;
  final Gestor Ref_Gestao = Gestor();
  final TextEditingController localController = TextEditingController();
  final TextEditingController obsController = TextEditingController();
  late DateTime _dataHora;
  String mensagemErro = '';

  @override
  void initState() {
    super.initState();
    _dataHora = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Ref_Gestao.load();
    int SIZE_ICON_PAGE_CENARIO_GERAL = int.parse(Ref_Gestao.get_definicao("SIZE_ICON_PAGE_CENARIO_GERAL"));
    int FONTSIZE_PAGE_CENARIO_GERAL = int.parse(Ref_Gestao.get_definicao("FONTSIZE_PAGE_CENARIO_GERAL"));
    int TAM_FONTSIZE_ERRO_PAGE_2 = int.parse(Ref_Gestao.get_definicao("TAM_FONTSIZE_ERRO_PAGE_2"));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(Ref_Gestao.get_definicao("TEXTO_NOVO_CENARIO_PAGE_CENARIOS")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // Ícone de local
            Icon(
              Icons.location_on,
              size: SIZE_ICON_PAGE_CENARIO_GERAL.toDouble(),
              color: Colors.black,
            ),
            SizedBox(height: 16),
            // TextField quadrado
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: TextField(
                controller: localController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Ref_Gestao.get_definicao("LABEL_LOCAL_PAGE_CENARIO_GERAL"),
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black,
                  fontSize:FONTSIZE_PAGE_CENARIO_GERAL.toDouble() ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            TextField(
                controller: obsController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: Ref_Gestao.get_definicao("LABEL_OBS_PAGE_CENARIO_GERAL"),
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black,
                  fontSize:FONTSIZE_PAGE_CENARIO_GERAL.toDouble() ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            SizedBox(height: 16),
            Text(
              '${Ref_Gestao.get_definicao("DATA_PAGE_CENARIO_GERAL")} ${DateFormat('dd/MM/yyyy').format(_dataHora)}',
              style: TextStyle(
                color: Colors.black, // Escolha a cor desejada
                fontSize: FONTSIZE_PAGE_CENARIO_GERAL.toDouble(), // Escolha o tamanho da fonte desejado
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${Ref_Gestao.get_definicao("HORA_PAGE_CENARIO_GERAL")} ${DateFormat('HH:mm').format(_dataHora)}',
              style: TextStyle(
                color: Colors.black, // Escolha a cor desejada
                fontSize: FONTSIZE_PAGE_CENARIO_GERAL.toDouble(), // Escolha o tamanho da fonte desejado
              ),
            ),

            SizedBox(height: 32),
            Text(
                mensagemErro,
                style: TextStyle(
                color: Colors.white,
                fontSize: TAM_FONTSIZE_ERRO_PAGE_2.toDouble(),),
              ),
            // Botão amarelo com texto preto
            ElevatedButton(
              onPressed: () {
                _criarNovoCenario();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(Ref_Gestao.get_definicao("CONTINUAR_PAGE_CENARIO_GERAL")),
            ),
          ],
        ),
      ),
    ),
    );
  }

 void _criarNovoCenario() async {
  // Obtenha os valores do local, observação, data e hora
  String local = localController.text;
  String obs = obsController.text;
  String data = DateFormat('yyyy-MM-dd').format(_dataHora); // Altere o formato conforme necessário
  String hora = DateFormat('HH:mm').format(_dataHora);//_dataHora.hour * 60 + _dataHora.minute;

  // Verifique se os campos não estão vazios
  if (local.isNotEmpty && obs.isNotEmpty) {
    // Navegue para a próxima tela e passe os valores como parâmetros
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NumeroVitimas(
          ajudante: widget.ajudante,
          local: local,
          obs: obs,
          data: data,
          hora: hora,
        ),
      ),
    );
  } else {
    // Mostre uma mensagem de erro ou faça algo apropriado se os campos estiverem vazios
    print('Campos não podem estar vazios');
    mensagemErro = Ref_Gestao.get_definicao("TEXT_CAMPO_VAZIO_PAGE_2");
  }
}


}
