import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oyo/Model/usermodel.dart';

import '../home/home_page.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  UserModel? UsersDataModel;
  String? imageUrl;

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
        imageUrl = doc.get("image");
        name.text = doc.get("name");
        email.text = doc.get('email');
      });
    }
  }

  File? imageFile;
  final picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      await uploadImageToFirebase(); // Wait for image upload to finish
      Fluttertoast.showToast(msg: 'Image uploaded successfully');
    }
  }

  Future<void> uploadImageToFirebase() async {
    final auth = FirebaseAuth.instance.currentUser?.uid;
    if (imageFile != null) {
      File file = File(imageFile!.path);
      var ref = FirebaseStorage.instance
          .ref()
          .child("usersImage")
          .child("$auth.jpg");
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
    }
  }

  void updateUser() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    await uploadImageToFirebase();
    await FirebaseFirestore.instance.collection("users").doc(auth).update({
      "name": name.text.trim(),
      "email": email.text.trim(),
      "image": imageUrl,
    }).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // Navigate back when the back button is pressed
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageUrl ??
                          "https://firebasestorage.googleapis.com/v0/b/flutterbasic-a5dcc.appspot.com/o/usersImage%2Fpic.webp?alt=media&token=6141432e-12ce-4633-a270-dfcecc902371"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      leading: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                      ),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.image,
                                        color: Colors.black,
                                      ),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 230),
                child: Text("Your Information",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(27),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "First name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26, right: 26, top: 29),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email Id",
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.only(top: 36),
                  child: ElevatedButton(
                    onPressed: () {
                      updateUser();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}