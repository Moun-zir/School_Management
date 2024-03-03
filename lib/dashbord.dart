import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tableau de Bord',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Text('Bienvenue sur le tableau de bord de l\'application de gestion scolaire.'),
            // Ajoutez ici d'autres widgets de votre choix pour le contenu du tableau de bord
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Déplacer l'icône à gauche
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.person,
                            size: 70,
                          ),
                        ),
                        SizedBox(width: 20), // Espace entre l'icône et le texte
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Ajuster le style du nombre
                              Text(
                                "24",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Ajuster le style du texte
                              Text(
                                "Nombre d'étudiant",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Déplacer l'icône à gauche
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.woman,
                            size: 70,
                          ),
                        ),
                        SizedBox(width: 20), // Espace entre l'icône et le texte
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Ajuster le style du nombre
                              Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Ajuster le style du texte
                              Text(
                                "Nombre de filles",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Déplacer l'icône à gauche
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.man,
                            size: 70,
                          ),
                        ),
                        SizedBox(width: 20), // Espace entre l'icône et le texte
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Ajuster le style du nombre
                              Text(
                                "16",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Ajuster le style du texte
                              Text(
                                "Nombre de garçon",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Espace entre les cartes et le tableau
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Text(
              '10 derniers étudiants inscrits',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20), // Espace entre le titre et le tableau
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Numéro')),
                  DataColumn(label: Text('Nom')),
                  DataColumn(label: Text('Prénoms')),
                  DataColumn(label: Text('Matricule')),
                  DataColumn(label: Text('Sexe')),
                  DataColumn(label: Text('Date Naissance')),
                  DataColumn(label: Text('Filière')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Nom 1')),
                    DataCell(Text('Prénom 1')),
                    DataCell(Text('Matricule 1')),
                    DataCell(Text('M')),
                    DataCell(Text('01/01/2000')),
                    DataCell(Text('Filière 1')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('Nom 2')),
                    DataCell(Text('Prénom 2')),
                    DataCell(Text('Matricule 2')),
                    DataCell(Text('F')),
                    DataCell(Text('02/02/2000')),
                    DataCell(Text('Filière 2')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('Nom 3')),
                    DataCell(Text('Prénom 3')),
                    DataCell(Text('Matricule 3')),
                    DataCell(Text('M')),
                    DataCell(Text('03/03/2000')),
                    DataCell(Text('Filière 3')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4')),
                    DataCell(Text('Nom 4')),
                    DataCell(Text('Prénom 4')),
                    DataCell(Text('Matricule 4')),
                    DataCell(Text('F')),
                    DataCell(Text('04/04/2000')),
                    DataCell(Text('Filière 4')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5')),
                    DataCell(Text('Nom 5')),
                    DataCell(Text('Prénom 5')),
                    DataCell(Text('Matricule 5')),
                    DataCell(Text('M')),
                    DataCell(Text('05/05/2000')),
                    DataCell(Text('Filière 5')),
                  ]),
                ],
              ),
            ),
          ),
          ],
        ));
  }
}
