import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercado/model/produto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerQuantidade = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrando Produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerNome,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerQuantidade,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerValor,
                  decoration: const InputDecoration(
                    labelText: 'Valor',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  child: const Text('Cadastrar'),
                  onPressed: () {
                    String nome = _controllerNome.text;
                    int? quantidade = int.tryParse(_controllerQuantidade.text);
                    double? valor = double.tryParse(_controllerValor.text);

                    if (quantidade == null || valor == null) {
                      return;
                    }

                    final Produto produtoNovo = Produto(nome, quantidade, valor);

                    print(produtoNovo);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
