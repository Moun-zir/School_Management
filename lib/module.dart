import 'package:flutter/material.dart';

// Classe pour représenter un module
class Module {
  late int numero;
  late String nom;

  Module({
    required this.numero,
    required this.nom,
  });
}

class AjoutModulePage extends StatefulWidget {
  @override
  State<AjoutModulePage> createState() => _AjoutModulePageState();
}

class _AjoutModulePageState extends State<AjoutModulePage> {
  List<Module> modules = [];

  void ajouterModule(String nom, {int? index, int? numero}) {
    int nouveauNumero = 1;
    if (index == null) {
      nouveauNumero = modules.isNotEmpty ? modules.last.numero + 1 : 1;
    }
    Module nouveauModule = Module(
      numero: numero ?? nouveauNumero,
      nom: nom,
    );

    if (index == null) {
      modules.add(nouveauModule);
    } else {
      modules[index] = nouveauModule;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
                color: Color(0xFFFFF8E1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'AJOUTEZ LES MODULES DES MATIERES',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: SizedBox(height: 80),
                  ),
                  _buildDropdown('FILIERE', ['Filière 1', 'Filière 2', 'Filière 3']),
                  _buildDropdown('OPTION', ['Option 1', 'Option 2', 'Option 3']),
                  _buildDropdown('NIVEAU', ['Niveau 1', 'Niveau 2', 'Niveau 3']),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
              color: Color(0xFFFFF8E1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(80, 50, 10, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        _showAddModuleModal(context);
                      },
                      child: Text('Ajouter un nouveau module'),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: 50,
                        columns: [
                          DataColumn(label: Text('Numéro')),
                          DataColumn(label: Text('Nom du Module')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: modules
                            .map(
                              (e) => DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  e.numero.toString(),
                                  style: TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF0D47A1)),
                                ),
                              ),
                              DataCell(
                                Text(
                                  e.nom,
                                  style: TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF0D47A1)),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        _showAddModuleModal(context,
                                            name: e.nom,
                                            index: modules.indexOf(e),
                                            numero: e.numero);
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
                                                  "Êtes-vous sûr de vouloir supprimer ce module ?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      modules.removeAt(
                                                          modules.indexOf(e));
                                                      modules = modules.map((e) {
                                                        e.numero = e.numero - 1;
                                                        return e;
                                                      }).toList();
                                                    });
                                                    Navigator.of(context).pop();
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
                            ],
                          ),
                        )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(), // Supprimer la ligne sous le dropdown
                    hint: Text('Sélectionnez $label'),
                    items: items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Action à effectuer lorsqu'un élément est sélectionné
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // Fonction pour afficher le modal d'ajout de module
  void _showAddModuleModal(BuildContext context, {int? index, int? numero ,String? name}) {
    String nom = name != null && name.isNotEmpty ? name : '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Ajouter un nouveau module"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: TextEditingController(text: nom),
                    decoration: InputDecoration(labelText: 'Nom du module'),
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
                    ajouterModule(nom,
                        index: index,
                        numero: numero
                    );

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
