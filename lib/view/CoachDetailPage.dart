import 'package:flutter/material.dart';

class CoachDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Coach'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffB81736), Color(0xff281537)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/boxe.jpg'),
              ),
            ),
            ListTile(
              title: Text('Nom du Coach'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Catégorie de Boxing'),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      Text('4.5'), // Note / évaluation du coach
                    ],
                  ),
                  Text('Adresse du Coach'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Description du Coach',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Commentaires et Avis',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    5, // Remplacez par le nombre de commentaires du coach
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Nom de l\'utilisateur'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            Text('4.0'), // Note de l'utilisateur
                          ],
                        ),
                        Text('Un commentaire sur le coach'),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action à effectuer pour donner une note au coach
                },
                child: Text('Donner une Note'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Action à effectuer pour écrire un commentaire sur le coach
                },
                child: Text('Écrire un Commentaire'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
