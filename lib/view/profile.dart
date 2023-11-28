import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ringtounsi_mobile/view/LevelScreen.dart';
import 'package:ringtounsi_mobile/view/SearchCoachScreen.dart';
import '../model/user.dart';
import 'firstScreen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _coverPhoto;

  @override
  void initState() {
    super.initState();
    _coverPhoto = 'assets/profile.jpg';
  }

  // Function to update user details
  Future<void> updateUser() async {
    final Uri apiUrl =Uri.parse('http://192.168.38.65:3000/api/v1/users/id/${widget.user.id}');

    try {
      final http.Response response = await http.patch(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'Authorization': 'Bearer ${widget.user.}',
        },
        body: jsonEncode(<String, dynamic>{
          'nom': widget.user.nom,
          'prenom': widget.user.prenom,
          //'bio': widget.user.bio,
          'email': widget.user.email,
          /*'birthDate': widget.user.birthDate.toString(),
          'level': widget.user.level,
          'address': widget.user.address,
          'phoneNumber': widget.user.phoneNumber,
          'boxingCategory': widget.user.boxingCategory,*/
          // Add other fields as needed
        }),
      );

      if (response.statusCode == 200) {
        // Successful update
        print('User updated successfully');
        // You can update local state or show a success message here
      } else {
        // Handle the error, show an error message, etc.
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error updating user: $error');
      // Handle the error, show an error message, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backgroundColor: Colors.black),
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
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            backgroundColor: Color(0xffB81736),
            onTap: (int index) {
              // Utiliser la navigation pour la page Profile
              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(user: widget.user),
                  ),
                );
              }
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstScreen(user: widget.user),
                  ),
                );
              }
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelScreen(),
                  ),
                );
              }
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchCoachScreen(),
                  ),
                );
              }
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffB81736), Color(0xff281537)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      _coverPhoto,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _editProfile(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 24, 1, 41), // Background color
                  onPrimary: Color(0xffB81736), // Text color
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Color(0xffB81736), // Edit icon color
                    ),
                    SizedBox(
                        width: 8), // Adjust the spacing between icon and text
                    Text('Edit Profile'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${widget.user.nom} ${widget.user.prenom}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Bio: ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Email: ${widget.user.email}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Date of Birth: ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Level: ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Address:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Phone Number:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Boxing Category: ',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ));
  }

  void _editProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  initialValue: widget.user.nom,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      widget.user.nom = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  initialValue: widget.user.prenom,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      widget.user.prenom = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bio'),
                  // initialValue: widget.user.bio,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      // widget.user.bio = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  initialValue: widget.user.email,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      widget.user.email = value;
                    });
                  },
                ),
                // Ajout de nouveaux champs
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date of Birth'),
                  // initialValue: widget.user.birthDate.toLocal().toString().split(' ')[0],
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      // widget.user.birthDate = DateTime.parse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Level'),
                  // initialValue: widget.user.level,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      // widget.user.level = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  // initialValue: widget.user.address,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      //widget.user.address = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  // initialValue: widget.user.phoneNumber,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      //widget.user.phoneNumber = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Boxing Category'),
                  // initialValue: widget.user.boxingCategory,
                  onChanged: (value) {
                    // Update the user object with the new value
                    setState(() {
                      // widget.user.boxingCategory = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic to save changes to the profile
                updateUser(); // Call the updateUser function to send the API request
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
