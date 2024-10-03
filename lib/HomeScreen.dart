import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:techlibrary/CadastroScreen.dart';
import 'package:techlibrary/repository/book_repository.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late Widget widget;

    return FutureBuilder(
      future: BookRepository.findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        log("Dados: ${snapshot.data}");
        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          widget = Column(
            children: [
              _buildSearchField(),
              _buildBookList(context),
            ],
          );
        } else {
          widget = Center(
            child: Text('Não existem dados'),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF00E0FF),
            title: Row(
              children: [
                Image.asset(
                  'assets/techlibrarylogo.png', // Substitua pelo caminho da sua imagem
                  // Ajuste a altura conforme necessário
                  width: 40,
                ),
                SizedBox(width: 16),
                Text('TechLibrary', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cadastro');
            },
            child: Icon(Icons.add),
          ),
          body: widget,
        );
      },
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Pesquisar livros na biblioteca da TechLibrary...',
          labelStyle: TextStyle(height: 1.5), // Ajusta a altura do label
          border: OutlineInputBorder(),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/lupa.png', // Caminho da imagem ao lado do label, lupa
              width: 48, // Ajuste o tamanho conforme necessário
              height: 48,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _customTitle('Lidos recentemente', Icons.history),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _bookPoster('O pequeno Príncipe', 'recentes1.jpg', context),
                  SizedBox(width: 40, height: 24),
                  _bookPoster('Diário de um zumbi do minecraft',
                      'recentes2.jpg', context),
                ],
              ),
            ),
            SizedBox(height: 72),
            _customTitle('Favoritos', Icons.favorite_border),

            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _bookPoster('O Homem De Giz', 'favorito1.jpg', context),
                  SizedBox(width: 40),
                  _bookPoster('O Hobbit', 'favorito2.jpg', context),
                  SizedBox(width: 40),
                  _bookPoster('Dom Quixote', 'favorito3.webp', context),
                ],
              ),
            ),
            // Adicione mais livros conforme necessário
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(String title, String subtitle, String iconPath) {
    return ListTile(
      leading: Image.asset(
        'assets/${iconPath}',
        width: 24, // Ajuste o tamanho conforme necessário
        height: 24,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Row _customTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 36,
        ),
        SizedBox(width: 12),
        Text(title),
      ],
    );
  }

  Widget _bookPoster(String name, String imgUrl, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/edit');
      },
      child: Column(
        children: [
          Image.asset(
            'assets/${imgUrl}',
            height: 175,
          ),
          const SizedBox(height: 4),
          Text(name),
        ],
      ),
    );
  }
}
