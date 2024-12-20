import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Firestore Example',
      home: FirestoreScreen(), // Ajout de l'écran FirestoreScreen comme page principale
    );
  }
}

class FirestoreScreen extends StatelessWidget {
  const FirestoreScreen({super.key});

  // Fonction pour ajouter un document à Firestore
  Future<void> addDocument() async {
    // Accéder à la collection Firestore
    CollectionReference users = FirebaseFirestore.instance.collection('super-nomdefamille-prenom-infini');

    // Créer un document avec les informations demandées
    try {
      await users.add({
        'firstName': 'Alexis', // Remplacez par votre prénom
        'lastName': 'Lazcano',  // Remplacez par votre nom de famille
        'creationDate': DateTime.now(),  // La date actuelle
        'expectedExamScore': 100,  // Remplacez par la note attendue
      });
      print("Document ajouté avec succès");
    } catch (e) {
      print("Erreur lors de l'ajout du document : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un Document Firestore')),
      body: Center(
        child: ElevatedButton(
          onPressed: addDocument,
          child: const Text('Ajouter Document'),
        ),
      ),
    );
  }
}
