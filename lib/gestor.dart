class Gestor{

  Map<String,String> definicoes = Map();

  void add_definicao(String key, String valor) {
    definicoes[key] = valor;
  }

  String get_definicao(String key) {
    if (definicoes.containsKey(key)) {
      return definicoes[key]!;
    } else {
      return "Essa chave não existe";
    }
  }

  void load(){
    print("OS DADOS DAS DEFINICOES FORAM CARREGADOS");

    this.add_definicao("TITULO_PAGE_1", "T.START");

    this.add_definicao("TOP_PAGE_2", "80");
    this.add_definicao("RIGHT_PAGE_2", "0");
    this.add_definicao("LEFT_PAGE_2", "0");
    this.add_definicao("WIDTH_PAGE_2", "100");
    this.add_definicao("HEIGHT_PAGE_2", "100");
    this.add_definicao("LABEL_TEXT_NOME_PAGE_2", "nomedoutilizador");
    this.add_definicao("LABEL_TEXT_PASS_PAGE_2", "Password");
    this.add_definicao("ESQUECER_SENHA_PAGE_2", "Esqueceu a senha?");
    this.add_definicao("BOTAO_ENTRAR_PAGE_2", "Entrar");
    this.add_definicao("TAM_SIZEDBOX_PAGE_2", "16");
    this.add_definicao("TAM_FONTSIZE_PAGE_2", "16");
    this.add_definicao("TAM_FONTSIZE_ERRO_PAGE_2", "14");
    this.add_definicao("BOTAO_REGISTRAR_PAGE_2", "Registrar");
    this.add_definicao("TEXT_CREDENCIAIS_ERROR_PAGE_2", "Credenciais inválidas");
    this.add_definicao("TEXT_CAMPO_VAZIO_PAGE_2", "Os campos não podem estar vazios");
    this.add_definicao("TEXT_POPUP_CODIGO_PAGE_2", "Código para alterar a senha");
    this.add_definicao("OP1_CARGO_PAGE_2", "Administração");
    this.add_definicao("OP2_CARGO_PAGE_2", "Bombeiro Militar");
    this.add_definicao("OP3_CARGO_PAGE_2", "Oficial Bombeiro");
    this.add_definicao("OP4_CARGO_PAGE_2", "Bombeiro Civil");
    this.add_definicao("OP5_CARGO_PAGE_2", "Técnico em Emergências Médicas");
    this.add_definicao("OP6_CARGO_PAGE_2", "Engenheiro de Incêndio");

    this.add_definicao("MUDAR_SENHA_PAGE_SENHA", "Alterar a senha");
    this.add_definicao("SENHA_ALTERADA_PAGE_SENHA", "Senha alterada com sucesso");
    this.add_definicao("LABEL_TEXT_ID_PAGE_SENHA", "ID do utilizador");
    this.add_definicao("LABEL_CODIGO_PASS_PAGE_SENHA", "Código de 4 digitos");
    this.add_definicao("LABEL_TEXT_PASS_NOVA_PAGE_SENHA", "Nova senha");
    this.add_definicao("CODIGO_INCORRETO_PAGE_SENHA", "Código incorreto");
    this.add_definicao("BTN_ALTERAR_SENHA_PAGE_SENHA", "Alterar senha");

    this.add_definicao("LABEL_TITLE_PAGE_3", "Registro");
    this.add_definicao("TAM_TITLE_PAGE_3", "20");
    this.add_definicao("LABEL_TEXT_NOME_PAGE_3", "nomedoutilizador");
    this.add_definicao("LABEL_TEXT_PASS_PAGE_3", "Password");
    this.add_definicao("LABEL_TEXT_CARGO_PAGE_3", "Cargo");
    this.add_definicao("TAM_FONTSIZE_ERRO_PAGE_3", "14");
    this.add_definicao("TEXT_USUARIO_EXISTENTE_PAGE_3", "Já existe um usuário com o mesmo nome");
    this.add_definicao("TEXT_USUARIO_REGISTRADO_PAGE_3", "Usuário registrado com sucesso");
    
    this.add_definicao("TAM_NOVO_CENARIO_PAGE_CENARIOS", "50");
    this.add_definicao("TEXTO_NOVO_CENARIO_PAGE_CENARIOS", "Novo Cenário");
    this.add_definicao("TAM_FONTSIZE_PAGE_CENARIOS", "20");
    this.add_definicao("TAM_DIVIDER_PAGE_CENARIOS", "20");
    this.add_definicao("OBS_PAGE_CENARIOS", "Observação:");
    this.add_definicao("QTD_VITIMAS_PAGE_CENARIOS", "Quantidade de Vítimas:");
    this.add_definicao("TAM_FONTSIZE_LIST_PAGE_CENARIOS", "21");
    this.add_definicao("TAM_FONTSIZE_LIST_OBS_PAGE_CENARIOS", "20");

    this.add_definicao("ANOS_PAGE_VITIMAS", "anos");

    this.add_definicao("LABEL_LOCAL_PAGE_CENARIO_GERAL", "Local");
    this.add_definicao("LABEL_OBS_PAGE_CENARIO_GERAL", "Observação");
    this.add_definicao("SIZE_ICON_PAGE_CENARIO_GERAL", "48");
    this.add_definicao("DATA_PAGE_CENARIO_GERAL", "Data");
    this.add_definicao("HORA_PAGE_CENARIO_GERAL", "Hora:");
    this.add_definicao("FONTSIZE_PAGE_CENARIO_GERAL", "20");
    this.add_definicao("CONTINUAR_PAGE_CENARIO_GERAL", "CONTINUAR");

    this.add_definicao("TEXT_PAGE_NUM_VITIMAS", "NÚMERO DE VITIMAS:");
    this.add_definicao("FONTSIZE_TEXT_NUM_VITIMAS_PAGE_NUM_VITIMAS", "20");
    this.add_definicao("LABEL_NUM_PAGE_NUM_VITIMAS", "número");
    this.add_definicao("SIZE_ICON_PAGE_NUM_VITIMAS", "100");
    this.add_definicao("BTN_BUTTON_PAGE_NUM_VITIMAS", "Confirmar");
    this.add_definicao("FONTSIZE_BTN_NUM_VITIMAS_PAGE_NUM_VITIMAS", "15");
    this.add_definicao("ERROR_PAGE_NUM_VITIMAS", "ERRO");
    this.add_definicao("QTD_ZERO_PAGE_NUM_VITIMAS", "A quantidade de vítimas deve ser maior que 0");
    this.add_definicao("OK_PAGE_NUM_VITIMAS", "OK");

    this.add_definicao("PERGUNTA_UM", "RESPIRA?");
    this.add_definicao("FONTSIZE_PERGUNTAS", "24");
    this.add_definicao("FONTSIZE_QUANTIDADE", "24");
    this.add_definicao("BTN_SIM", "SIM");
    this.add_definicao("BTN_NAO", "NÃO");
    this.add_definicao("RESPIRA_FR_PAGE_PERGUNTAS", "Frequência Respiratória:");
    this.add_definicao("BTN_MENOR_RESPIRA_FR_PAGE_PERGUNTAS", "[10,29] cr/min");
    this.add_definicao("BTN_MAIOR_RESPIRA_FR_PAGE_PERGUNTAS", "<10,>30 cr/min");
    this.add_definicao("RESPIRA_FC_PAGE_PERGUNTAS", "Frequência Cardíaca");
    this.add_definicao("BTN_MAIOR_CARDIACA_FC_PAGE_PERGUNTAS", "<120 bat/min");
    this.add_definicao("BTN_MENOR_CARDIACA_FC_PAGE_PERGUNTAS", "≥120 bat/min");
    this.add_definicao("LEGENDA_PAGE_PERGUNTAS", "Legenda:");
    this.add_definicao("LEGENDA_FR_PAGE_PERGUNTAS", "FR - frequência respiratória");
    this.add_definicao("LEGENDA_FC_PAGE_PERGUNTAS", "FR - frequência respiratória");
    this.add_definicao("PERGUNTA_TRES", "ESTÁ FERIDO?");

    this.add_definicao("OBSERVACOES_PAGE_OBS", "Observaçoes");
    this.add_definicao("BTN_MASC_PAGE_OBS", "masc");
    this.add_definicao("BTN_FEM_PAGE_OBS", "fem");
    this.add_definicao("LABEL_NOME_PAGE_OBS", "nome");
    this.add_definicao("LABEL_IDADE_PAGE_OBS", "idade");
    this.add_definicao("BTN_SINAIS_SINTOMAS_PAGE_OBS", "sinais e sintomas");
    this.add_definicao("BTN_CONCLUIR_PAGE_OBS", "CONCLUIR");
    this.add_definicao("BTN_HEMORRAGIA_PAGE_SINAIS_SINTOMAS", "hemorragia");
    this.add_definicao("BTN_DESMAIO_PAGE_SINAIS_SINTOMAS", "desmaio");
    this.add_definicao("BTN_FRATURA_PAGE_SINAIS_SINTOMAS", "fratura");
    this.add_definicao("BTN_DIFICUL_RESPIRAR_PAGE_SINAIS_SINTOMAS", "dificul. respirar");
    this.add_definicao("LABEL_OUTROS_PAGE_SINAIS_SINTOMAS", "outros");
    this.add_definicao("SIZE_ICON_PAGE_SINAIS_SINTOMAS", "100");
    this.add_definicao("OBS_APP_BAR_PAGE_SINAIS_SINTOMAS", "Observações da Vítima:");

    this.add_definicao("ANOS_PAGE_LISTA_VITIMAS", "anos");
    this.add_definicao("ID_CENARIO_FONTSIZE_PAGE_LISTA_VITIMAS", "25");
    this.add_definicao("ESTADO_FONTSIZE_PAGE_LISTA_VITIMAS", "23");
    this.add_definicao("INFO_FONTSIZE_PAGE_LISTA_VITIMAS", "20");

    this.add_definicao("TEXT_P0_ESTADO", "P0");
    this.add_definicao("TEXT_P1_ESTADO", "P1");
    this.add_definicao("TEXT_P2_ESTADO", "P2");
    this.add_definicao("TEXT_P3_ESTADO", "P3");

    this.add_definicao("WIDTH_P0", "100");
    this.add_definicao("HEIGHT_P0", "100");
    this.add_definicao("TEXT_P0", "VÍTIMA P0");
    this.add_definicao("TEXT_P1", "VÍTIMA P1");
    this.add_definicao("TEXT_P2", "VÍTIMA P2");
    this.add_definicao("TEXT_P3", "VÍTIMA P3");
    this.add_definicao("TAM_ICON_PAGE_P0", "100");
    this.add_definicao("TAM_FONTSIZE_PAGE_P0", "24");
    
    this.add_definicao("TAM_TITLE_PAGE_PERFIL", "16");
    this.add_definicao("TITLE_PERFIL", "PERFIL");
    this.add_definicao("FONTSIZE_TEXT_PAGE_PERFIL", "20");
    this.add_definicao("TEXT_ID_PAGE_PERFIL", "ID:");
    this.add_definicao("TEXT_NOME_PAGE_PERFIL", "USUÁRIO:");
    this.add_definicao("TEXT_CARGO_PAGE_PERFIL", "FUNÇÃO:");
    this.add_definicao("TOP_PAGE_PERFIL", "260");
    this.add_definicao("LEFT_PAGE_PERFIL", "60");
    this.add_definicao("RIGHT_PAGE_PERFIL", "60");
    this.add_definicao("BTN_REGISTRAR_PAGE_PERFIL", "Registrar Usuários");

    this.add_definicao("SIZE_ICON_PAGE_ENVIADO", "100");
    this.add_definicao("ENVIADO_PAGE_ENVIADO", "Enviado");
    this.add_definicao("FONTSIZE_PAGE_ENVIADO", "25");
    

    print(definicoes);
  }

}