import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _selectedOption = 'Dashboard'; // Option sélectionnée par défaut

  // Méthode pour mettre à jour l'option sélectionnée
  void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  // Méthode pour afficher le modal
  // Méthode pour afficher le modal d'année
  void _showYearModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Vous voulez ajouter une nouvelle année scolaire!!!'),
              TextField(
                decoration: InputDecoration(labelText: 'Entrez l\'année'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
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
              ),
            ],
          ),
        );
      },
    );
  }

// Méthode pour afficher le modal de filière
  void _showFiliereModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Ajouter une nouvelle filière'),
              TextField(
                decoration: InputDecoration(labelText: 'Nom de la filière'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
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
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('oui');
    return Scaffold(
      appBar: AppBar(
        title: Text('SCHOOL MANAGEMENT'),
        backgroundColor: Color.fromARGB(255, 170, 211, 244),
        actions: [
          // Option "Année scolaire" à droite de l'app bar
          PopupMenuButton(
            onSelected: (value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Clock')));
              print('super');
              // Gestion de la sélection dans le menu déroulant
              // Ajoutez ici le traitement nécessaire pour chaque option sélectionnée
              if (value == 'Ajouter une nouvelle année') {
                print('ajout effectué');
                _showYearModal(
                    context); // Afficher le modal pour ajouter une nouvelle année
              } else if (value == 'Ajouter une nouvelle filière') {
                _showFiliereModal(
                    context); // Afficher le modal pour ajouter une nouvelle filière
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 0,
                child: Text('Ajouter une nouvelle'),
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
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 80,
              color: Colors.grey[200],
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Tableau de Bord'),
                    selected: _selectedOption == 'Dashboard',
                    onTap: () => _updateSelectedOption('Dashboard'),
                  ),
                  ListTile(
                    title: Text('Ajouter une nouvelle année'),
                    selected: _selectedOption == 'Ajouter une nouvelle année',
                    onTap: () =>
                        _updateSelectedOption('Ajouter une nouvelle année'),
                  ),
                  ListTile(
                    title: Text('Ajouter une nouvelle option'),
                    selected: _selectedOption == 'Ajouter une nouvelle option',
                    onTap: () =>
                        _updateSelectedOption('Ajouter une nouvelle option'),
                  ),
                  ListTile(
                    title: Text('Ajouter une nouvelle filière'),
                    selected: _selectedOption == 'Ajouter une nouvelle filière',
                    onTap: () =>
                        _updateSelectedOption('Ajouter une nouvelle filière'),
                  ),
                ],
              ),
            ),
          ),
          // Contenu changeant à droite
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  // Méthode pour construire le contenu en fonction de l'option sélectionnée
  Widget _buildContent() {
    switch (_selectedOption) {
      case 'Ajouter une nouvelle année':
        return Center(
          child: Text(
            'Contenu de l\'option "Ajouter une nouvelle année"',
            style: TextStyle(fontSize: 18),
          ),
        );
      case 'Ajouter une nouvelle option':
        return Center(
          child: Text(
            'Contenu de l\'option "Ajouter une nouvelle option"',
            style: TextStyle(fontSize: 18),
          ),
        );
      case 'Ajouter une nouvelle filière':
        return Center(
          child: Text(
            'Contenu de l\'option "Ajouter une nouvelle filière"',
            style: TextStyle(fontSize: 18),
          ),
        );
      default:
        return Center(
          child: Text(
            'Contenu du tableau de bord',
            style: TextStyle(fontSize: 18),
          ),
        );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
  ));
}
