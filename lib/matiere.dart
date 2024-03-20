import 'package:flutter/material.dart';

// Classe pour représenter un module
class Matiere {
  late int numero;
  late String nom;

  Matiere({
    required this.numero,
    required this.nom,
  });
}

class AjoutMatierePage extends StatefulWidget {
  @override
  State<AjoutMatierePage> createState() => AjoutMatierePageState();
}

class AjoutMatierePageState extends State<AjoutMatierePage> {
  List<Matiere> matiere = [];

  void ajouterMatiere(String nom, {int? index, int? numero}) {
    int nouveauNumero = 1;
    if (index == null) {
      nouveauNumero = matiere.isNotEmpty ? matiere.last.numero + 1 : 1;
    }
    Matiere nouveauModule = Matiere(
      numero: numero ?? nouveauNumero,
      nom: nom,
    );

    if (index == null) {
      matiere.add(nouveauModule);
    } else {
      matiere[index] = nouveauModule;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      body: Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                ),
                  color: Color(0xFFFFF8E1),
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical
            crossAxisAlignment: CrossAxisAlignment.center, // Centrage horizontal
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFEF5350),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'AJOUTEZ LES MATIERES DES MODULES',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centrage horizontal
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FILIERE',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        DropdownButton<String>(
                          hint: Text('Sélectionnez une filière'),
                          items: <String>['Filière 1', 'Filière 2', 'Filière 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Action à effectuer lorsqu'une filière est sélectionnée
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OPTION',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        DropdownButton<String>(
                          hint: Text('Sélectionnez une option'),
                          items: <String>['Option 1', 'Option 2', 'Option 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Action à effectuer lorsqu'une option est sélectionnée
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NIVEAU',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        DropdownButton<String>(
                          hint: Text('Sélectionnez un niveau'),
                          items: <String>['Niveau 1', 'Niveau 2', 'Niveau 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Action à effectuer lorsqu'un niveau est sélectionné
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MODULE',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        DropdownButton<String>(
                          hint: Text('Sélectionnez un module'),
                          items: <String>['Module 1', 'Module 2', 'Module 3']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Action à effectuer lorsqu'une option est sélectionnée
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  _showAddMatiereModal(context);
                },
                child: Text('Ajouter une nouvelle matière'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: DataTable(
                  columnSpacing: 50,
                  columns: [
                    DataColumn(label: Text('Numéro')),
                    DataColumn(label: Text('Nom de la matiere')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: matiere
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Text(
                                e.numero.toString(),
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.nom,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            DataCell(
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        _showAddMatiereModal(
                                          context,
                                          name: e.nom,
                                          index: matiere.indexOf(e),
                                          numero: e.numero,
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Confirmation"),
                                              content: Text(
                                                  "Êtes-vous sûr de vouloir supprimer cette matiere ?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      matiere.removeAt(
                                                          matiere.indexOf(e));
                                                      matiere = matiere.map((e) {
                                                        e.numero = e.numero - 1;
                                                        return e;
                                                      }).toList(); // Supprimer l'élément de la liste
                                                    });
                                                    Navigator.of(context)
                                                        .pop(); // Fermer la boîte de dialogue de confirmation
                                                  },
                                                  child: Text('Supprimer'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  // Fonction pour afficher le modal d'ajout de module
  void _showAddMatiereModal(BuildContext context,
      {int? index, int? numero, String? name}) {
    String nom = name != null && name.isNotEmpty ? name : '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Ajouter une nouvelle matière"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: TextEditingController(text: nom),
                    decoration: InputDecoration(labelText: 'Nom de la matiere'),
                    onChanged: (value) {
                      nom = value;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fermer le modal
                  },
                  child: Text('Annuler'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ajouter le module à la liste
                    ajouterMatiere(nom, index: index, numero: numero);

                    Navigator.of(context).pop(); // Fermer le modal
                  },
                  child: Text('Valider'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
