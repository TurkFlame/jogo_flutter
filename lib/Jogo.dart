import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("padrao");
  var _mensagem = 'Escolha uma opção abaixo';
  final Map<String, AssetImage> _opcoesImagem = {
    "pedra": AssetImage("pedra"),
    "papel": AssetImage("papel"),
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

    if ((escolhaUsuario == escolhaApp)) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jokenpo'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 10),
                  child: Text('Escolha do App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              Image(
                image: this._imagemApp,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 10),
                  child: Text('Sua escolha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () => _opcaoSelecionada("pedra"),
                        child: Image.asset(
                          "assets/pedra.png",
                          height: 100,
                        )),
                    GestureDetector(
                        onTap: () => _opcaoSelecionada("papel"),
                        child: Image.asset(
                          "assets/papel.png",
                          height: 100,
                        )),
                    GestureDetector(
                        onTap: () => _opcaoSelecionada("tesoura"),
                        child: Image.asset(
                          "assets/tesoura.png",
                          height: 100,
                        ))
                  ])
            ]));
  }
}
