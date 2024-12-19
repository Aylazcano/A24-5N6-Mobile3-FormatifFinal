import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mystery Number Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mystery Number Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final Dio _dio = Dio();

  Future<void> _sendRequest() async {
    final String baseUrl = "https://examen-final-h23.azurewebsites.net/";
    final String name = _nameController.text.trim();
    final String number = _numberController.text.trim();

    if (name.isEmpty || number.isEmpty) {
      _showSnackBar('Veuillez remplir tous les champs.');
      return;
    }

    final String url = "$baseUrl$name/$number";

    try {
      final response = await _dio.get(url);
      _showSnackBar('Succès : ${response.data}');
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          _showSnackBar('Erreur : ${e.response!.data}');
        } else if (e.response!.statusCode == 404) {
          _showSnackBar('Erreur : Données invalides ou non trouvées.');
        } else {
          _showSnackBar('Erreur inattendue : ${e.response!.statusCode}');
        }
      } else {
        _showSnackBar('Erreur réseau : ${e.message}');
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Entrez le nom et l\'année (ex : John2023)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Entrez un nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendRequest,
              child: const Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
