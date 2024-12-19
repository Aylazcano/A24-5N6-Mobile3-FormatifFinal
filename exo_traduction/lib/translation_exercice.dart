import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class TranslationExercise extends StatelessWidget {
  const TranslationExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Liste des mois traduits
    final months = [
      S.of(context).jan,
      S.of(context).feb,
      S.of(context).mar,
      S.of(context).apr,
      S.of(context).may,
      S.of(context).jun,
      S.of(context).jul,
      S.of(context).aug,
      S.of(context).sep,
      S.of(context).oct,
      S.of(context).nov,
      S.of(context).dec,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title), // Titre traduit
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image affichée en pleine largeur
          Image.network(
            "https://fourn6-mobile-prof.onrender.com/exos/image",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          // Boutons Oui et Non
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Action Oui
                  },
                  child: Text(S.of(context).yes),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Action Non
                  },
                  child: Text(S.of(context).no),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Liste des mois avec boutons supprimer
          Expanded(
            child: ListView.builder(
              itemCount: months.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(months[index]!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Action supprimer (ne fait rien ici)
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
