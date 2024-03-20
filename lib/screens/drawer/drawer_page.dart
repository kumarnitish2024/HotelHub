import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart';

import '../profile/profile_page.dart';
import '../registers/Signin_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? name;
  String? email;
  String? imageUrl;
  int? number;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection("users").doc(auth).get();

    if (doc.exists) {
      setState(() {
        name = doc.get('name');
        email = doc.get('email');
        imageUrl = doc.get('image');
        number = doc.get('number');
      });
    } else {
      // Handle the case when the document doesn't exist
      print("User data not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: ListView(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.25,
                          // Half of the totalWidth in ProfilePhoto
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage("$imageUrl"
                              // "https://www.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej.png",
                              ),
                        ),

                        ProfilePhoto(
                          totalWidth: 0.5,
                          cornerRadius: 0.5,
                          color: Colors.blue,
                          outlineColor: Colors.white,
                          outlineWidth: 2,
                          textPadding: 10,
                          showName: true,
                          fontColor: Colors.white,
                          nameDisplayOption: NameDisplayOptions.initials,
                          fontWeight: FontWeight.w500,
                          badgeAlignment: Alignment.bottomCenter,
                          onTap: () {
                            // open profile for example
                          },
                          onLongPress: () {
                            // popup to message user for example
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "$name",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "$email",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
              },
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.pink,
                ),
                title: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.pink),
                ),
                onTap: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditProfile(),));
                },
              ),
            ),
            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.pink,
              ),
              title:
                  const Text('setting', style: TextStyle(color: Colors.pink)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.location_on,
                color: Colors.pink,
              ),
              title:
                  const Text('Location', style: TextStyle(color: Colors.pink)),
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => MapCurrent(),));
              },
            ),

            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.pink,
              ),
              title:
                  const Text('Log Out', style: TextStyle(color: Colors.pink)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Column(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.pink,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Are you sure you want to logout?",
                              style: TextStyle(color: Colors.pink)),
                        ),
                        // Text('Are you sure you want to logout?',style: TextStyle(color: Colors.pink))
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No', style: TextStyle(color: Colors.pink),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          // FirebaseAuth.instance.signOut().then((value) {
                          //   //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                          // });
                          FirebaseAuth.instance.signOut().then((value){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
                          });
                        },
                        child: const Text('Yes', style: TextStyle(color: Colors.pink),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
