// Tela de cadastro
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _idController =
      TextEditingController(); // Controlador para ID
  final TextEditingController _editoraController =
      TextEditingController(); // Controlador para Editora
  final TextEditingController _livroController =
      TextEditingController(); // Controlador para Livro
  final TextEditingController _autorController =
      TextEditingController(); // Controlador para Autor
  final TextEditingController _paginasController =
      TextEditingController(); // Controlador para Nº de Páginas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/techlibrarylogo.png', // Substitua pelo caminho da sua imagem
           // Ajuste a altura conforme necessário
        ),
        leadingWidth: 40,
        title: Text('Cadastrar Livro', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _editoraController,
              decoration: InputDecoration(
                labelText: 'Editora', // Corrigido o fechamento de aspas
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _livroController,
              decoration: InputDecoration(
                labelText: 'Livro',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _autorController,
              decoration: InputDecoration(
                labelText: 'Autor(a)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _paginasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nº de Páginas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String editora = _editoraController.text;
                final String livro = _livroController.text;
                final String autor = _autorController.text;
                final String paginas = _paginasController.text;

                if (editora.isNotEmpty &&
                    livro.isNotEmpty &&
                    autor.isNotEmpty &&
                    paginas.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Livro cadastrado com sucesso!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Por favor, preencha todos os campos.')),
                  );
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
