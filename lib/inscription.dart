import 'package:flutter/material.dart';
import 'package:ecoleapp/infos.dart'; // Import de la page InfosPage

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  // Liste des options pour la liste déroulante
  List<String> option = ['Choix', 'Masculin', 'Féminin'];
  List<String> filieres = ['Filière A', 'Filière B', 'Filière C'];
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  List<String> niveaux = ['Niveau 1', 'Niveau 2', 'Niveau 3'];

  // Valeur sélectionnée par défaut pour la liste déroulante
  String selectedOption = '';
  String selectedFiliere = '';
  String selectedOptions = '';
  String selectedNiveau = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFORMATIONS DE L\' ETUDIANT',
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
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Sexe',
                  ),
                  value: selectedOption, // Utilisez une variable pour stocker la valeur sélectionnée
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  items: ['','Masculin', 'Féminin']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Date de naissance',
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
                    labelText: 'Matricule',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Filière',
                  ),
                  value: selectedFiliere,
                  onChanged: (newValue) {
                    setState(() {
                      selectedFiliere = newValue!;
                    });
                  },
                  items: ['','Filière A', 'Filière B', 'Filière C']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Option',
                  ),
                  value: selectedOption,
                  onChanged: (newValue) {
                    setState(() {
                      selectedOption = newValue!;
                    });
                  },
                  items: ['','Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Niveau',
                  ),
                  value: selectedNiveau,
                  onChanged: (newValue) {
                    setState(() {
                      selectedNiveau = newValue!;
                    });
                  },
                  items: ['','Niveau 1', 'Niveau 2', 'Niveau 3']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                    labelText: 'Adresse',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nationalité',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Numero de télephone',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Répétez les autres lignes de champs de texte ou de widgets ici...
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfosPage()), // Redirection vers la page infos.dart
              );
            },
            child: Text('SUIVANT'), // Changement du texte du bouton
          ),
        ],
      ),
    );
  }
}
