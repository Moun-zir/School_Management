import 'package:flutter/material.dart';

class ListeEtudiantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LISTE DES ÉTUDIANTS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sélectionnez la filière dont-il s\'agit',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        hint: Text('Sélectionnez une filière'),
                        items: <String>[
                          'Filière 1',
                          'Filière 2',
                          'Filière 3'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Action à effectuer lorsqu'une filière est sélectionnée
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sélectionnez l\'option dont-il s\'agit',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        hint: Text('Sélectionnez une option'),
                        items: <String>[
                          'Option 1',
                          'Option 2',
                          'Option 3'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Action à effectuer lorsqu'une option est sélectionnée
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sélectionnez le niveau dont-il s\'agit',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        hint: Text('Sélectionnez un niveau'),
                        items: <String>[
                          'Niveau 1',
                          'Niveau 2',
                          'Niveau 3'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Action à effectuer lorsqu'un niveau est sélectionné
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsqu'on appuie sur le bouton "Afficher"
              },
              child: Text('Afficher'),
            ),
          ],
        ),
      ),
    );
  }
}
