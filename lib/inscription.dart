import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  // Liste des options pour la liste déroulante
  List<String> options = ['Choix', 'Masculin', 'Féminin'];

  // Valeur sélectionnée par défaut pour la liste déroulante
  String selectedOption = 'Choix';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Formulaire d\'inscription',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Logique pour soumettre le formulaire
            },
            child: Text('S\'inscrire'),
          ),
        ],
      ),
    );
  }
}
