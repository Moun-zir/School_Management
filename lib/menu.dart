import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final VoidCallback onDashboardSelected;
  final VoidCallback onInscriptionSelected;

  Menu({
    required this.onDashboardSelected,
    required this.onInscriptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: ListView(
        children: [
          ListTile(
            title: Text('Dashboard'),
            onTap: onDashboardSelected,
          ),
          ListTile(
            title: Text('Inscription'),
            onTap: onInscriptionSelected,
          ),
          ListTile(
            title: Text('Gestion de Notes'),
            onTap: () {
              // Naviguer vers la gestion des notes
            },
          ),
        ],
      ),
    );
  }
}
