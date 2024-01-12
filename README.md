# TStart - Aplicativo de Suporte para Bombeiros

## Descrição

O TStart é um aplicativo desenvolvido em Dart para auxiliar bombeiros no registro e monitoramento de cenas de emergência. O aplicativo facilita a documentação rápida e eficiente de incidentes, permitindo aos bombeiros registrar informações cruciais sobre o local, vítimas e condições gerais.

## Créditos

A ideia e o design deste aplicativo foram concebidos por X e Y. A implementação do aplicativo foi realizada por Laís Santos.

## Funcionalidades

1. **Autenticação de Usuário**
   - Os usuários podem fazer login para acessar as funcionalidades do aplicativo.

2. **Visualização de Cenários Existente**
   - Após o login, os bombeiros têm acesso a uma lista de cenas já registradas no banco de dados.

3. **Adicionar Novo Cenário**
   - Ao selecionar a opção para adicionar um novo cenário, o aplicativo registra automaticamente a hora e o dia do incidente.
   - Os usuários precisam fornecer informações sobre o local e observações gerais da cena.

4. **Registro de Vítimas**
   - Os bombeiros podem registrar o número de vítimas no local.

5. **Questionário sobre Estado das Vítimas**
   - O aplicativo apresenta uma série de perguntas relacionadas ao estado das vítimas, incluindo observações específicas.

6. **Avaliação do Estado do Cliente (P0 - P3)**
   - Com base nas respostas fornecidas, o aplicativo gera automaticamente uma avaliação do estado do cliente, atribuindo um código de prioridade de P0 a P3.

## Requisitos de Instalação

Certifique-se de ter o ambiente de desenvolvimento Dart instalado em sua máquina antes de executar o aplicativo.

```bash
# Instale as dependências
$ flutter pub get

# Execute o aplicativo
$ flutter run

![Captura de Tela (400)](https://github.com/LaisDomingos/TStart/assets/50579591/e43d3cc0-5ac7-444a-810a-9d6d634739cc)
![Captura de Tela (401)](https://github.com/LaisDomingos/TStart/assets/50579591/e1b56d4b-42be-418e-a270-b750349fc64f)
![Captura de Tela (402)](https://github.com/LaisDomingos/TStart/assets/50579591/d39e1c9f-8906-4cb7-b00d-46446c70dcbe)
![Captura de Tela (403)](https://github.com/LaisDomingos/TStart/assets/50579591/64cf9484-93d1-4293-8ca2-dee92e8c36b8)
![Captura de Tela (404)](https://github.com/LaisDomingos/TStart/assets/50579591/2a70d491-2c37-497f-aeee-03ebdef149a8)
![Captura de Tela (405)](https://github.com/LaisDomingos/TStart/assets/50579591/89097796-3411-41a1-b15b-f52fe4fff29f)
![Captura de Tela (406)](https://github.com/LaisDomingos/TStart/assets/50579591/7a8bfa29-68e3-4ec4-8cea-5f4c19bf1457)
![Captura de Tela (407)](https://github.com/LaisDomingos/TStart/assets/50579591/383cbc86-840a-4572-85a0-2feb031c376f)




