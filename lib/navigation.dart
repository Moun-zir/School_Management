import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _selectedOption = 'Dashboard'; // Option sélectionnée par défaut

  // Méthodes pour afficher les modals

  void _showYearModal(BuildContext context) {
    // Implémentation de la méthode pour afficher le modal d'année
  }

  void _showFiliereModal(BuildContext context) {
    // Implémentation de la méthode pour afficher le modal de filière
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCHOOL MANAGEMENT'),
        backgroundColor: Color.fromARGB(255, 170, 211, 244),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              // Gestion de la sélection dans le menu déroulant
              if (value == 'Ajouter une nouvelle année') {
                _showYearModal(context);
              } else if (value == 'Ajouter une nouvelle filière') {
                _showFiliereModal(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 'Ajouter une nouvelle année',
                child: Text('Ajouter une nouvelle année'),
              ),
              PopupMenuItem(
                value: 'Ajouter une nouvelle filière',
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
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
  ));
}


