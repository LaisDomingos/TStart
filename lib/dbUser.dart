import 'package:tstart/registerPage.dart';
import 'package:tstart/gestor.dart';
import 'package:mysql1/mysql1.dart';

var settings = new ConnectionSettings(
  host: '10.0.2.2',
  port: 3306,
  user: 'root',
  password: 'root',
  db: 'tstart',
  //useSSL: true
);


class User{
  final int? id;
  final String nome;
  final String password;
  final String cargo;

  User({
    this.id,
    required this.nome,
    required this.password,
    required this.cargo,
  });

  Map<String, dynamic> mapear(){ //a função se chama mapear, dynamic -> pode ser mais que um tipo
    return {
      'nome': nome,
      'password': password,
      'cargo': cargo,
    };
  }

  @override
  String toString() {
    return 'User{ nome: $nome, password: $password, cargo: $cargo}';
  }
}

class CenarioClass {
  final int? id;
  final String local;
  final String data;
  final String hora;
  final String obs;
  final int qtdVitima;

  CenarioClass({
    this.id,
    required this.local,
    required this.data,
    required this.hora,
    required this.obs,
    required this.qtdVitima,
  });

  Map<String, dynamic> mapear() {
    return {
      'local': local,
      'data': data,
      'hora': hora,
      'obs': obs,
      'qtdVitima': qtdVitima
    };
  }
}

class Vitima {
  final int? id;
  final int cenarioId;
  final String estado;
  final String nome;
  final int idade;
  final List<String> sinaisSintomas; 
  final String obs; 

  Vitima({
    this.id,
    required this.estado,
    required this.nome,
    required this.idade,
    required this.sinaisSintomas,
    required this.obs,
    required this.cenarioId,
  });

  Map<String, dynamic> mapear() {
    return {
      'cenario_id': cenarioId,
      'estado': estado,
      'nome': nome,
      'idade': idade,
      'sinais_sintomas': sinaisSintomas.join(','), 
      'obs': obs,
    };
  }
}
int idCenario = 0;

class ajudanteUserBD {
  final Gestor Ref_Gestao = Gestor();
  late MySqlConnection _conn;
  Future<void> connectToMySql() async {
    try {
      _conn = await MySqlConnection.connect(settings);
      print("Conectado ao MySQL");
    } catch (e) {
      print("Erro ao conectar ao MySQL: $e");
    }
  }

  /*Future<void> init() async {
    await connectToMySql();
  }*/


  Future<void> inserirUser(User user) async {
    Ref_Gestao.load();

    // Verifica se já existe um usuário com o mesmo nome
    var resultados = await _conn.query(
      'SELECT * FROM users WHERE nome = ?',
      [user.nome],
    );

    if (resultados.isEmpty) {
      // Se não houver usuários com o mesmo nome, realiza a inserção
      await _conn.query('INSERT INTO users (nome, password, cargo) VALUES (?, ?, ?)',
          [user.nome, user.password, user.cargo]);

      mensagemErroRegister = Ref_Gestao.get_definicao("TEXT_USUARIO_REGISTRADO_PAGE_3");
    } else {
      print('Já existe um usuário com o mesmo nome: ${user.nome}');
      mensagemErroRegister = Ref_Gestao.get_definicao("TEXT_USUARIO_EXISTENTE_PAGE_3");
    }
  }

  Future<bool> verificarCredenciais(String nome, String password) async {
    // Consultar o banco de dados para verificar se o usuário com as credenciais fornecidas existe
    var resultados = await _conn.query(
      'SELECT * FROM users WHERE nome = ? AND password = ?',
      [nome, password],
    );

    // Se a lista de resultados não estiver vazia, isso significa que o usuário existe
    return resultados.isNotEmpty;
  }
  Future<User?> buscarUsuarioPorNome(String nome) async {
  try {
    Ref_Gestao.load();

    var resultados = await _conn.query(
      'SELECT id, nome, password, cargo FROM users WHERE nome = ?',
      [nome],
    );

    if (resultados.isNotEmpty) {
      print('Resultados: $resultados');

      var primeiroResultado = resultados.first;
      return User(
        id: primeiroResultado['id'],
        nome: primeiroResultado['nome'].toString(),
        password: primeiroResultado['password'].toString(),
        cargo: primeiroResultado['cargo'].toString(),
      );
    }

    return null; // Retorna null se não encontrar o usuário
  } catch (e) {
    print('Erro ao buscar usuário por nome: $e');
    // Trate o erro, se necessário
    return null;
  }
}


  Future<User?> buscarUsuarioPorId(int id) async {
    try {
      Ref_Gestao.load();

      var resultados = await _conn.query(
        'SELECT * FROM users WHERE id = ?',
        [id],
      );

      if (resultados.isNotEmpty) {
        print('Resultados: $resultados');

        var primeiroResultado = resultados.first;
        return User(
          id: primeiroResultado['id'],
          nome: primeiroResultado['nome'].toString(),
          password: primeiroResultado['password'].toString(),
          cargo: primeiroResultado['cargo'].toString(),
        );
      }

      return null; // Retorna null se não encontrar o usuário
    } catch (e) {
      print('Erro ao buscar usuário por ID: $e');
      // Trate o erro, se necessário
      return null;
    }
  }
  Future<void> atualizarSenhaUsuario(int userId, String novaSenha) async {
  try {
    Ref_Gestao.load();

    await _conn.query(
      'UPDATE users SET password = ? WHERE id = ?',
      [novaSenha, userId],
    );

    print('Senha do usuário atualizada com sucesso');
  } catch (e) {
    print('Erro ao atualizar senha do usuário: $e');
    // Lide com o erro de atualização, se necessário
  }
}

Future<int> inserirCenario(CenarioClass cenario) async {
  try {
    Ref_Gestao.load();

    await _conn.query('INSERT INTO cenarios (local, data, hora, obs, qtdVitima) VALUES (?, ?, ?, ?, ?)',
        [cenario.local, cenario.data, cenario.hora, cenario.obs, cenario.qtdVitima]);

    // Recupere o ID do cenário inserido
    var resultados = await _conn.query('SELECT LAST_INSERT_ID() as id');
    idCenario = resultados.first['id'];

    print('Cenário inserido com sucesso. ID: $idCenario');
    return idCenario;
  } catch (e) {
    print('Erro ao inserir cenário: $e');
    // Lide com o erro de inserção, se necessário
    return 0; // Retorne 0 em caso de erro
  }
}



Future<List<CenarioClass>> buscarTodosCenarios() async {
  try {
    Ref_Gestao.load();
    print('Chamando buscarTodosCenarios');

    var resultados = await _conn.query('SELECT * FROM cenarios');

    print('Resultados da consulta: $resultados');

    return resultados.map((map) {
      return CenarioClass(
        id: map['id'],
        local: map['local'].toString(),
        data: map['data'].toString(),
        hora: map['hora'].toString(),
        obs: map['obs'].toString(), 
        qtdVitima: map['qtdVitima'],
      );
    }).toList();

  } catch (e) {
    print('Erro ao buscar todos os cenários: $e');
    return [];
  }
}



  Future<void> inserirVitima(Vitima vitima) async {
  try {
    Ref_Gestao.load();

    await _conn.query('INSERT INTO vitimas (cenario_id, estado, nome, idade, sinais_sintomas, obs) VALUES (?, ?, ?, ?, ?, ?)',
        [vitima.cenarioId, vitima.estado, vitima.nome, vitima.idade, vitima.sinaisSintomas.join(','), vitima.obs]);

    print("Inseriu vítima no banco de dados");
  } catch (e) {
    print('Erro ao inserir vítima: $e');
    // Lide com o erro de inserção, se necessário
  }
}

Future<List<Vitima>> buscarVitimasPorCenario(int cenarioId) async {
  try {
    Ref_Gestao.load();

    var resultados = await _conn.query(
      'SELECT * FROM vitimas WHERE cenario_id = ?',
      [cenarioId],
    );

    return resultados.map((map) {
      return Vitima(
        id: map['id'],
        cenarioId: map['cenario_id'],
        estado: map['estado'].toString(),
        nome: map['nome'].toString(),
        idade: map['idade'],
        sinaisSintomas: (map['sinais_sintomas']).toString().split(','),
        obs: map['obs'].toString(),
      );
    }).toList();
  } catch (e) {
    print('Erro ao buscar vítimas por cenário: $e');
    return [];
  }
}





}