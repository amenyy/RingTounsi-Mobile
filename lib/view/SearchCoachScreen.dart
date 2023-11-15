import 'package:flutter/material.dart';
import 'package:ringtounsi_mobile/view/profile.dart';
import 'package:ringtounsi_mobile/view/firstScreen.dart';
import 'package:ringtounsi_mobile/view/LevelScreen.dart';
import 'package:ringtounsi_mobile/view/SearchCoachScreen.dart';
import 'package:ringtounsi_mobile/view/CoachDetailPage.dart';

class SearchCoachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chercher un Coach'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffB81736), Color(0xff281537)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Chercher un coach par catégorie, nom, adresse...',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (text) {
                  // Action lors de la saisie dans la barre de recherche
                  // Vous pouvez implémenter la logique de recherche ici
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    10, // Remplacez 10 par le nombre de coachs à afficher
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        // Photo du coach (peut être remplacée par une image depuis une URL ou le système de fichiers)
                        backgroundImage: AssetImage('assets/gloves.png'),
                      ),
                      title: Text('Nom du Coach $index'),
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
                          Text('Adresse du Coach $index'),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoachDetailPage()),
                        );
                        // Action à effectuer lors du clic sur un coach
                        // Naviguer vers la page de détails du coach par exemple
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center, size: 30),
              label: 'Training',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_martial_arts, size: 30),
              label: 'About',
            ),
          ],
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,
          backgroundColor: Color(0xffB81736),
          onTap: (int index) {
            // Actions à effectuer lors de la navigation sur le BottomNavigationBar
            // Exemple : Navigation vers les différentes pages
          },
        ),
      ),
    );
  }
}
