import 'package:ecoleapp/infos.dart';
import 'package:ecoleapp/liste.dart';
import 'package:flutter/material.dart';
import 'package:ecoleapp/dashbord.dart';
import 'package:ecoleapp/inscription.dart';
import 'package:ecoleapp/menu.dart';
import 'package:ecoleapp/filiere.dart';

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
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _currentContent = DashboardContent();
  String dropdownValue = "2023-2024";

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

  void _showFiliere() {
    setState(() {
      _currentContent = AjoutFilierePage(); // Affiche la page de filière
    });
  }

  void _showListe() {
    setState(() {
      _currentContent = ListeEtudiantsPage(); // Affiche la page de filière
    });
  }

  void _showInfos() {
    setState(() {
      _currentContent = InfosPage(); // Affiche la page de infos
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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 18.0, vertical: 60.0),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Valider'),
              onPressed: () {
                // Ajoutez ici la logique pour valider l'année scolaire
                Navigator.of(context).pop();
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
            SizedBox(width: 700),
            Text('Année Scolaire : '),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                }
              },
              items: <String>[
                '2023-2024',
                '2022-2023',
                '2021-2022',
                '2020-2021'
              ].map<DropdownMenuItem<String>>((String value) {
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
          PopupMenuButton(
            onSelected: (value) {
              if (value == '0') {
                _showYearModal(context);
              } else if (value == '2') {
                _showFiliere();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: '0',
                child: Text('Ajouter une nouvelle année'),
              ),
              PopupMenuItem(
                value: '1',
                child: Text('Ajouter une nouvelle option'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('Ajouter une nouvelle filière'),
              ),
            ],
          ),
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
        ],
      ),
      body: Row(
        children: [
          Menu(
            onDashboardSelected: _showDashboard,
            onInscriptionSelected: _showInscription,
            onFiliereSelected: _showFiliere,
            onListeSelected: _showListe,
            onInfosSelected: _showInfos,
          ),
          Expanded(
            child: _currentContent,
          ),
        ],
      ),
    );
  }
}
