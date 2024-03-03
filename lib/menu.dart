import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final VoidCallback onDashboardSelected;
  final VoidCallback onInscriptionSelected;
  final VoidCallback onFiliereSelected;
  final VoidCallback onListeSelected;
  final VoidCallback onInfosSelected;

  Menu({
    required this.onDashboardSelected,
    required this.onInscriptionSelected,
    required this.onFiliereSelected,
    required this.onListeSelected,
    required this.onInfosSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Color.fromARGB(255, 241, 146, 146),
      padding: EdgeInsets.only(top: 30.0),
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.dashboard), // Icône pour le tableau de bord
            title: Text('DASHBORD'),
            onTap: onDashboardSelected,
          ),
          SizedBox(height: 15.0),
          ListTile(
            leading: Icon(Icons.person_add), // Icône pour l'inscription
            title: Text('INSCRIPTION'),
            onTap: onInscriptionSelected,
          ),
          SizedBox(height: 15.0),
          ListTile(
            leading: Icon(Icons.people), // Icône pour la liste des étudiants
            title: Text('LISTE DES ETUDIANTS'),
            onTap: onListeSelected,
          ),
          SizedBox(height: 15.0),
          ListTile(
            leading: Icon(Icons.assignment), // Icône pour la gestion des notes
            title: Text('GESTION NOTE'),
            onTap: () {
              // Naviguer vers la gestion des notes
            },
          ),
        ],
      ),
    );
  }
}
