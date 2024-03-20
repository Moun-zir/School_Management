import 'package:cloud_firestore/cloud_firestore.dart';
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
  late String? selectedFiliere;
  late String? selectedOption;
  late String? selectedNiveau;
  late String scolarite = '';
  late bool showOptionField = false;
  late bool showScolariteField = false;


  Future<void>_loadFiliere() async
  {
    final snapshot = await  FirebaseFirestore.instance.collection('FILIERE').get();
    filieres = snapshot.docs.map((doc) => Filiere(
      numero: doc.data()['numero'],
      nom: doc.data()['nom'],
      option: doc.data()['option'],
      niveau: doc.data()['niveau'],
      scolarite: doc.data()['scolarite'],

  )).toList();


  }



  void ajouterFiliere(
      String nom,
      String option,
      String niveau,
      String scolarite, {
        int? index,
        int? numero,
      }) {
    int nouveauNumero = 0;
    if (index == null) {
      nouveauNumero = filieres.isNotEmpty ? filieres.last.numero + 1 : 1;
    }

    Filiere nouvelleFiliere = Filiere(
      numero: numero ?? nouveauNumero,
      nom: nom,
      option: option,
      niveau: niveau,
      scolarite: scolarite,
    );
    if (index == null) {
      filieres.add(nouvelleFiliere);
    } else {
      filieres[index] = nouvelleFiliere;
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
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEF5350),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'AJOUTEZ LES FILIERES',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showAddFiliereModal(context);
                    },
                    child: Text('Ajouter un nouveau prix de formation'),
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
                                      _showAddFiliereModal(
                                        context,
                                        name: e.nom,
                                        niveaux: e.niveau,
                                        options: e.option,
                                        scolarites: e.scolarite,
                                        index: filieres.indexOf(e),
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
                                                "Êtes-vous sûr de vouloir supprimer cette filière ?"),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Text('Annuler'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    filieres.removeAt(
                                                        filieres.indexOf(e));
                                                    filieres = filieres
                                                        .map((e) {
                                                      e.numero =
                                                          e.numero - 1;
                                                      return e;
                                                    }).toList();
                                                  });
                                                  Navigator.of(context)
                                                      .pop();
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

  // Fonction pour afficher le modal d'ajout de filière
  void _showAddFiliereModal(
      BuildContext context, {
        int? numero,
        int? index,
        String? name,
        String? options,
        String? niveaux,
        String? scolarites,
      }) {
    String nom = name != null && name.isNotEmpty ? name : '';
    String option = options != null && options.isNotEmpty ? options : '';
    String niveau = niveaux != null && niveaux.isNotEmpty ? niveaux : '';
    String scolarite =
    scolarites != null && scolarites.isNotEmpty ? scolarites : '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("AJOUTER UN NOUVEAU PRIX DE FORMATION",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Champ de texte pour le choix de la filière
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'FILIERE',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                            ),
                            value: nom,
                            onChanged: (value) {
                              setState(() {
                                nom = value!;
                                showOptionField = nom.isNotEmpty;

                              });
                            },
                            items: filieres.map<DropdownMenuItem<String>>((Filiere value) {

                              return DropdownMenuItem<String>(
                                value: value.nom,
                                child: Text(value.nom),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Champ de texte pour le choix de l'option
                    if (showOptionField)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'OPTION',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                              value: option,
                              onChanged: (value) {
                                setState(() {
                                  option = value!;
                                  showScolariteField = true;
                                });
                              },
                              items: ['', 'SIL', 'RIT', 'SI']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 10),
                    // Champ de texte pour le choix du niveau
                    if (showOptionField)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'NIVEAU',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                              value: niveau,
                              onChanged: (value) {
                                setState(() {
                                  niveau = value!;
                                });
                              },
                              items: ['', 'LICENCE1', 'LICENCE2', 'LICENCE3']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 10),
                    // Champ de texte pour la scolarité
                    if (showScolariteField)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'SCOLARITE',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller:
                              TextEditingController(text: scolarite),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                              onChanged: (value) {
                                scolarite = value;
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Annuler'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ajouterFiliere(nom, option, niveau, scolarite,
                        index: index, numero: numero);
                    Navigator.of(context).pop();
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
