import 'package:flutter/material.dart';

// Classe pour représenter une filière avec ses options, niveaux et scolarités
class Filiere {
  late int numero;
  late String nom;
  late String option;
  late String niveau;
  late String scolarite;

  Filiere({
    required this.numero,
    required this.nom,
    required this.option,
    required this.niveau,
    required this.scolarite,
  });
}

// Liste pour stocker les filières

class AjoutFilierePage extends StatefulWidget {
  @override
  State<AjoutFilierePage> createState() => _AjoutFilierePageState();
}

class _AjoutFilierePageState extends State<AjoutFilierePage> {
  List<Filiere> filieres = [];
  void ajouterFiliere(
      String nom, String option, String niveau, String scolarite,
      {int? index}) {
    int nouveauNumero = filieres.isNotEmpty ? filieres.last.numero + 1 : 1;
    Filiere nouvelleFiliere = Filiere(
      numero: nouveauNumero,
      nom: nom,
      option: option,
      niveau: niveau,
      scolarite: scolarite,
    );
   // if(filieres=i)
    filieres.add(nouvelleFiliere);
    //filieres.insert(index, nouvelleFiliere);
    // print(filieres);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajout de filière'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nouvelle filière',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action à effectuer lorsqu'on appuie sur le bouton "Nouvelle filière"
                  _showAddFiliereModal(
                      context); // Appel de la fonction pour afficher le modal
                },
                child: Text('Ajouter une nouvelle filière'),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: DataTable(
                columnSpacing: 50,
                columns: [
                  DataColumn(label: Text('Numéro')),
                  DataColumn(label: Text('Filière')),
                  DataColumn(label: Text('Option')),
                  DataColumn(label: Text('Niveau')),
                  DataColumn(label: Text('Scolarité')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: filieres
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
                            Text(
                              e.option.toString(),
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              e.niveau.toString(),
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              e.scolarite.toString(),
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
                                      _showAddFiliereModal(context,
                                          name: e.nom,
                                          niveaux: e.niveau,
                                          options: e.option,
                                          scolarites: e.scolarite,
                                          index: filieres.indexOf(e));

                                      // Action à effectuer lorsqu'on appuie sur Modifier
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      // Action à effectuer lorsqu'on appuie sur Supprimer
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
    );
  }

  // Fonction pour afficher le modal d'ajout de filière
  void _showAddFiliereModal(
    BuildContext context, {
    int? index,
    String? name,
    String? options,
    String? niveaux,
    String? scolarites,
  }) {
    String nom = 
        name != null && name.isNotEmpty ? name : 'Sectionner';
    String option =
        options != null && options.isNotEmpty ? options : 'Sectionner';
    String niveau =
        niveaux != null && niveaux.isNotEmpty ? niveaux : 'Sectionner';
    String scolarite =
        scolarites != null && scolarites.isNotEmpty ? scolarites : '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Ajouter une nouvelle filière"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Liste déroulante pour le choix de la filière
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Filière'),
                    value: nom,
                    onChanged: (value) {
                      setState(() {
                        nom = value!;
                      });
                    },
                    items: ['Sectionner', 'GE', 'AG', 'SCIENCE', 'BIO']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  // Liste déroulante pour le choix de l'option
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Option'),
                    value: option,
                    onChanged: (value) {
                      setState(() {
                        option = value!;
                      });
                    },
                    items: ['Sectionner', 'SIL', 'RIT', 'SI']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  // Liste déroulante pour le choix du niveau
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Niveau'),
                    value: niveau,
                    onChanged: (value) {
                      setState(() {
                        niveau = value!;
                      });
                    },
                    items: ['Sectionner', 'LICENCE1', 'LICENCE2', 'LICENCE3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  // Champ de texte pour la scolarité
                  TextField(
                    controller: TextEditingController(text: scolarite),
                    decoration: InputDecoration(labelText: 'Scolarité'),
                    onChanged: (value) {
                      scolarite = value;
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
                    // Ajouter la filière à la liste
                    ajouterFiliere(nom, option, niveau, scolarite,
                        index: index);

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
