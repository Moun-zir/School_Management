import 'package:flutter/material.dart';

class ListeEtudiantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 15, 0),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
            ),
            color: Color(0xFFFFF8E1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONSULTEZ LA LISTE DES ETUDIANTS',
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
                          'FILIERE',
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
                          'OPTION',
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
                          'NIVEAU',
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
      ),
    );
  }
}
