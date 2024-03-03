import 'package:flutter/material.dart';

class InfosPage extends StatefulWidget {
  @override
  State<InfosPage> createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFORMATIONS SUPPLEMENTAIRES'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            'INFORMATIONS SUPPLEMENTAIRES',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Logique pour soumettre le formulaire
            },
            child: Text('SUIVANT'),
          ),
        ],
      
        ),
      ),
    );
  }
}
