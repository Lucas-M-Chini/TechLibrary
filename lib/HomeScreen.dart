import 'package:flutter/material.dart';
import 'package:techlibrary/CadastroScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechLibrary'),
         backgroundColor: Color(0xFF00E0FF)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          _buildSearchField(),
          _buildBookList(),
        ],
      ),
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

  Widget _buildBookList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _customTitle('Lidos recentemente', Icons.history),
            Row(
              children: [
                _bookPoster('O pequeno Príncipe', 'recentes1.jpg'),
                SizedBox(width: 40, height: 24),
                _bookPoster('Diário de um zumbi do minecraft', 'recentes2.jpg'),
              ],
            ),
            SizedBox(height: 72),
            _customTitle('Favoritos', Icons.favorite_border),
            
            Row(
              children: [
                _bookPoster('O Homem De Giz', 'favorito1.jpg'),
                SizedBox(width: 40),
                _bookPoster('O Hobbit', 'favorito2.jpg'),
                SizedBox(width: 40),
                _bookPoster('Dom Quixote', 'favorito3.webp'),
              ],
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
        iconPath,
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

  Column _bookPoster(String name, String imgUrl) {
    return Column(
      children: [
        Image.asset(
          imgUrl,
          height: 175,
        ),
        SizedBox(height: 4),
        Text(name),
      ],
    );
  }
}
