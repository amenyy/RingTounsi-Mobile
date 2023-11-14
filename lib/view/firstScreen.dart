import 'package:flutter/material.dart';
import 'package:ringtounsi_mobile/view/profile.dart';
import 'package:ringtounsi_mobile/view/welcomeScreen.dart';

import '../model/user.dart'; // Import other pages

class FirstScreen extends StatelessWidget {
  final User user;

  FirstScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: 70.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Text(
                'Hello ${user.nom} ${user.prenom}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 100.0,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/gloves.png'),
                width: 100.0,
                height: 100.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(user: user),
    );
  }

  AthleteLevelSelector() {}
}

class CustomBottomNavigationBar extends StatelessWidget {
  final User user;

  CustomBottomNavigationBar({required this.user});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          icon: Icon(Icons.info, size: 30),
          label: 'About',
        ),
      ],
      selectedItemColor: Color.fromARGB(255, 0, 0, 0),
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xffB81736),
      onTap: (int index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen(user: user)),
          );
        }
        // Add similar logic for other pages
      },
    );
  }
}
