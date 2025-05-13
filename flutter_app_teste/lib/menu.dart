import 'package:flutter/material.dart';
import 'package:flutter_app_teste/testeapp.dart';
import 'package:flutter_app_teste/utils/tools.dart';

class Menu extends StatefulWidget {
  final String? username;
  

  const Menu({super.key, this.username});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController _messagesController = TextEditingController();
  final List<String> _messagesSend = [];

  @override
  void dispose() {
    _messagesController.dispose();
    super.dispose();
  }

  void _clearTextField() {
    _messagesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF017092),
        centerTitle: true,
        title: const Text('Menu'), // Adicionado const
      ),
      body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Para a coluna se ajustar ao conteúdo
                    children: [
                      const ListOfText(textFormatation: 'adskdsld'),
                      Text('Postado por ${username.toUpperCase()}, as ${DateTime.now().hour}:${DateTime.now().minute}', style: const TextStyle(fontSize: 16, color: Colors.black54)), // Adicionado const
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( // Erro 1: Envolver os filhos em uma Row
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messagesController,
                      decoration: const InputDecoration(
                        hintText: 'Digite algo...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // Espaçamento entre o TextField e o botão
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _clearTextField, // Chama a função para limpar o texto
                    color: Theme.of(context).primaryColor, // Erro 3: Adicionando cor ao ícone
                  ),
                ],
              ),
            ),
        ]
      ),
    );
  }
}