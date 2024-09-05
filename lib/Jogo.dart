import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("aassets/padrao.png");
  var _mensagem = 'Escolha uma opção abaixo';
  final Map<String, AssetImage> _opcoesImagem = {
    "pedra": AssetImage("pedra"),
    "padrao": AssetImage("padrao"),
    "tesoura": AssetImage("tesoura")
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do app: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    setState(() {
      this._imagemApp = _opcoesImagem[escolhaApp]!;
    });

    if ((escolhaUsuario == 'pedra' && escolhaApp == "tesoura") ||
        (escolhaUsuario == 'tesoura' && escolhaApp == "papel") ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        this._mensagem = 'Parabéns!!! Você ganhou :)';
      });
    } else if (escolhaUsuario == escolhaApp) {
      setState(() {
        this._mensagem = 'Empate!!!';
      });
    } else {
      setState(() {
        this._mensagem = 'Você perdeu :(';
      });
    }
  }
}
