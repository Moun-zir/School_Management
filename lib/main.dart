import 'package:ecoleapp/infos.dart';
import 'package:ecoleapp/liste.dart';
import 'package:ecoleapp/matiere.dart';
import 'package:ecoleapp/module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ecoleapp/dashbord.dart';
import 'package:ecoleapp/inscription.dart';
import 'package:ecoleapp/menu.dart';
import 'package:ecoleapp/filiere.dart';
import 'Login.dart';
import 'connexion.dart';
import 'package:firebase_core/firebase_core.dart';

import 'note.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
if (!kIsWeb){
await Firebase.initializeApp();
} else {
    await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: "AIzaSyCqpCubr6oTBw6krkkOhs0_B3BEgHvn2zU",
    authDomain: "school-management-5374c.firebaseapp.com",
    databaseURL: "https://school-management-5374c-default-rtdb.firebaseio.com",
    projectId: "school-management-5374c",
    storageBucket: "school-management-5374c.appspot.com",
    messagingSenderId: "293012024406",
    appId: "1:293012024406:web:b6d05872aba0cacc299ff7",
    measurementId: "G-QPNW9SM04P"
    )
);
}

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
      home:  Connect(),
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

  void _showModule() {
    setState(() {
      _currentContent = AjoutModulePage(); // Affiche la page de filière
    });
  }

  void _showMatiere() {
    setState(() {
      _currentContent = AjoutMatierePage(); // Affiche la page de filière
    });
  }

  void _showNote() {
    setState(() {
      _currentContent = AjoutNotePage(); // Affiche la page de filière
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
      body: Row(
        children: [
          Container(width: 240,
            child: Menu(
              onDashboardSelected: _showDashboard,
              onInscriptionSelected: _showInscription,
              onFiliereSelected: _showFiliere,
              onListeSelected: _showListe,
              onInfosSelected: _showInfos,
              onModuleSelected: _showModule,
              onMatiereSelected: _showMatiere,
              onNoteSelected: _showNote,
            ),
          ),

          Expanded(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF0D47A1),
                title: Row(
                  //mainAxisAlignment: MainAxisAlignment.center, // Alignement de la barre de navigation vers la droite
                  children: [
                    //SizeBox(width: 200),
                    Text('UNIVERSITY MANAGEMENT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20), // Ajout d'un espacement entre le titre et la barre de recherche
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher...',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Définir le rayon de bordure
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    SizedBox(width: 20), // Espacement entre la barre de recherche et l'année scolaire
                    Text('ANNEE SCOLAIRE ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    ),
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
                //backgroundColor: Colors.grey,
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == '0') {
                        _showYearModal(context);
                      } else if (value == '1') {
                        _showFiliere();
                      } else if (value == '2') {
                        _showModule();
                      } else if (value == '3') {
                        _showMatiere();
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        value: '0',
                        child: Text('Ajouter une nouvelle année'),
                      ),
                      PopupMenuItem(
                        value: '1',
                        child: Text('Ajouter un prix de formation'),
                      ),
                      PopupMenuItem(
                        value: '2',
                        child: Text('Ajouter un nouveau module'),
                      ),
                      PopupMenuItem(
                        value: '3',
                        child: Text('Ajouter une nouvelle matière'),
                      ),
                    ],
                  ),
                ],
              ),
              body: Row(
                children: [

                  Expanded(
                    child: _currentContent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
