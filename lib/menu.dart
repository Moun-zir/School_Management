import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final VoidCallback onDashboardSelected;
  final VoidCallback onInscriptionSelected;
  final VoidCallback onFiliereSelected;
  final VoidCallback onListeSelected;
  final VoidCallback onInfosSelected;
  final VoidCallback onModuleSelected;
  final VoidCallback onMatiereSelected;
  final VoidCallback onNoteSelected;

  Menu({
    required this.onDashboardSelected,
    required this.onInscriptionSelected,
    required this.onFiliereSelected,
    required this.onListeSelected,
    required this.onInfosSelected,
    required this.onModuleSelected,
    required this.onMatiereSelected,
    required this.onNoteSelected,
  });

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selectedItem = 'Dashboard'; // Élément de menu sélectionné par défaut

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      color: Color(0xFF0D47A1),
      padding: EdgeInsets.fromLTRB(12, 30, 0, 0), // Ajustement de la position verticale
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 35, 0, 20),
            child: CircleAvatar(
              backgroundColor: Colors.white, // Couleur de fond blanc
              radius: 60, // Rayon du cercle
              child: Image.asset(
                'assets/images/ok.png', // Chemin vers votre image
                width: 100, // Largeur de l'image
                height: 100, // Hauteur de l'image
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildMenuItem('Dashboard', Icons.dashboard, widget.onDashboardSelected),
                buildMenuItem('Inscription', Icons.person_add, widget.onInscriptionSelected),
                buildMenuItem('Etudiants', Icons.people, widget.onListeSelected),
                buildMenuItem('Gestion de note', Icons.assignment, widget.onNoteSelected),
                buildMenuItem('Emploi du temps', Icons.edit_calendar, widget.onNoteSelected),
                buildMenuItem('Deconnexion', Icons.logout, widget.onNoteSelected),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Stack(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: selectedItem == title ? Colors.white : Colors.white54,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: selectedItem == title ? Colors.white : Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
              selectedItem = title; // Mettre à jour l'élément de menu sélectionné
            });
            onTap(); // Appeler la fonction associée à l'élément de menu sélectionné
          },
          tileColor: selectedItem == title ? Colors.white.withOpacity(0.2) : null,
          selectedTileColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(selectedItem == title ? 20 : 0),
              bottomRight: Radius.circular(selectedItem == title ? 20 : 0),
            ),
          ),
        ),
        if (selectedItem == title)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
      ],
    );
  }
}
