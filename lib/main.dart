import 'package:ecoleapp/dashbord.dart';
import 'package:ecoleapp/inscription.dart';
import 'package:ecoleapp/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Scolaire',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _currentContent = DashboardContent();
  String dropdownValue = "2023-2024"; // Contenu par défaut : Dashboard

  void _showDashboard() {
    setState(() {
      _currentContent = DashboardContent();
    });
  }

  void _showInscription() {
    setState(() {
      _currentContent = InscriptionPage();
    });
  }

  Future<void> _showYearModal(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('NOUVELLE ANNEE SCOLAIRE !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Entrez l\'année'),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 60.0), // Ajuster le padding selon vos besoins
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le modal
              },
            ),
            TextButton(
              child: Text('Valider'),
              onPressed: () {
                // Ajoutez ici la logique pour valider l'année scolaire
                Navigator.of(context).pop(); // Ferme le modal
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showFiliereModal(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter une nouvelle filière'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Contenu du modal de la filière (à ajouter selon vos besoins)
                TextField(
                  decoration: InputDecoration(labelText: 'Nom de la filière'),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 80.0), // Ajuster le padding selon vos besoins
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le modal
              },
            ),
            TextButton(
              child: Text('Valider'),
              onPressed: () {
                // Ajoutez ici la logique pour valider la filière
                Navigator.of(context).pop(); // Ferme le modal
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('SCHOOL MANAGEMENT'),
            SizedBox(width: 700), // Espacement entre le texte et le champ de liste déroulante
            Text('Année Scolaire : '), // Texte "Année Scolaire :"
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) { // Modifier la signature pour accepter String?
                if(newValue != null) { // Vérifier si newValue n'est pas null
                  setState(() {
                    dropdownValue = newValue;
                  });
                }
  },
  items: <String>['2023-2024', '2022-2023', '2021-2022', '2020-2021']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
),
],
        ),
        backgroundColor: Color.fromARGB(255, 170, 211, 244),
       actions: [
          // Option "Année scolaire" à droite de l'app bar
          PopupMenuButton(
            onSelected: (value) {
              // Gestion de la sélection dans le menu déroulant
              // Ajoutez ici le traitement nécessaire pour chaque option sélectionnée
              if (value == 0) {
                //print('ajout effectué');
                _showYearModal(
                    context); // Afficher le modal pour ajouter une nouvelle année
              } else if (value == 2) {
                _showFiliereModal(
                    context); // Afficher le modal pour ajouter une nouvelle filière
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 0,
                child: Text('Ajouter une nouvelle année'),
              ),
              PopupMenuItem(
                value: 1,
                child: Text('Ajouter une nouvelle option'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Ajouter une nouvelle filière'),
              ),
            ],
          ),
          // Icône de personne avec une liste déroulante d'options
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 'Profil',
                child: Text('Profil'),
              ),
              PopupMenuItem(
                value: 'Déconnexion',
                child: Text('Déconnexion'),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.person),
            ),
          ),
        ],),
      body: Row(
        children: [
          Menu(
            onDashboardSelected: _showDashboard,
            onInscriptionSelected: _showInscription,
          ),
          Expanded(
            child: _currentContent, // Afficher le contenu actuel ici
          ),
        ],
      ),
    );
  }
}
