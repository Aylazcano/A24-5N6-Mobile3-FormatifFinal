import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:numberpicker/numberpicker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirestoreExample(),
    );
  }
}

class FirestoreExample extends StatefulWidget {
  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  final TextEditingController _contenuController = TextEditingController();
  final TextEditingController _numeroPosteController = TextEditingController();
  bool _isOnHighTable = false; // Variable pour indiquer si vous êtes sur une table haute
  int _numeroDePoste = 0; // Default value for the NumberPicker

  @override
  void initState() {
    super.initState();
    // Initialize the number picker value with the text controller value if available
    _numeroPosteController.addListener(() {
      if (_numeroPosteController.text.isNotEmpty) {
        setState(() {
          _numeroDePoste = int.tryParse(_numeroPosteController.text) ?? 0;
        });
      }
    });
  }

  void _updateNumeroPoste(String value) {
    setState(() {
      _numeroDePoste = int.tryParse(value) ?? 0;
    });
  }

  void _addDocument() {
    String contenu = _contenuController.text.trim();
    int numeroDePoste = _numeroDePoste; // Utiliser la valeur de NumberPicker
    bool suisSurUneTableHaute = _isOnHighTable;

    FirebaseFirestore.instance
        .collection('Examens')
        .doc('FinalA23')
        .collection('Eleves')
        .add({
      'contenu': contenu,
      'numeroDePoste': numeroDePoste,
      'suisSurUneTableHaute': suisSurUneTableHaute,
    }).then((_) {
      print("Document ajouté avec succès !");
      _contenuController.clear();
      _numeroPosteController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Document ajouté avec succès !')),
      );
    }).catchError((error) {
      print("Erreur lors de l'ajout du document : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'ajout du document : $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firestore Examen Final')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _contenuController,
                    decoration: InputDecoration(labelText: 'Contenu'),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _numeroPosteController,
                    decoration: InputDecoration(labelText: 'Numéro de Poste'),
                    keyboardType: TextInputType.number,
                    onChanged: _updateNumeroPoste,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: NumberPicker(
                    value: _numeroDePoste,
                    minValue: 0,
                    maxValue: 99,
                    onChanged: (value) {
                      setState(() {
                        _numeroDePoste = value;
                        _numeroPosteController.text = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: Text('Suis sur une table haute'),
                    value: _isOnHighTable,
                    onChanged: (bool value) {
                      setState(() {
                        _isOnHighTable = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _addDocument,
                    child: Text('Ajouter Document'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
