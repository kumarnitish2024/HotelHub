import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:oyo/screens/buttonnavigations_view/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({Key? key}) : super(key: key);

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  int?number;
  Future getMobileNumber()async{
    var shar= await SharedPreferences.getInstance();
    setState(() {
      number=shar.getInt('number');
    });
  }

  @override
  void initState() {
    super.initState();
    getMobileNumber();
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _DateBirthdayController = TextEditingController();

  validate() {
    if (_nameController.text.length < 3) {
      Fluttertoast.showToast(msg: "please valid name");
    } else if(_nameController.text.contains(RegExp(r'[0-9]'))){
      Fluttertoast.showToast(msg: "Number Not allowed Into Name");
    }else if(!_nameController.text.startsWith(RegExp(r'[A-Z]'))){
      Fluttertoast.showToast(msg: "Name Must Start With Capital letter");
    }
    // else if(!_emailController.text.startsWith(RegExp(r'[a-z]'))){
    //   Fluttertoast.showToast(msg: "Email Should Start With small letter");
    // }
    else if (!_emailController.text.contains("@gmail.com")) {
      Fluttertoast.showToast(msg: "please valid email");
    } else if (_address.text.length <= 3) {
      Fluttertoast.showToast(msg: "please valid address");
    } else if (_DateBirthdayController.text.length <= 3){
      Fluttertoast.showToast(msg: "please valid date");
    }
    else  {
      userFirestore();
    }
  }

   userFirestore() {
     // var auth = FirebaseAuth.instance.currentUser?.uid;
      FirebaseFirestore.instance.collection("users").add({
        "name": _nameController.text,
        "email": _emailController.text,
        "address": _address.text,
        "Date of Birth": _DateBirthdayController.text,
        "number": number.toString(),
      }).then((value_) {
        FirebaseFirestore.instance.collection("users").doc(value_.id).update({"uid":value_.id});
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ButtonNavigation()),
        );
        Fluttertoast.showToast(msg: "Successfully added to Firestore");
      }).catchError((error) {
        print("Error adding/updating document to Firestore: $error");
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: [
          Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_u8o7BL.json',height: 300),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Full Name*',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  width: 500,
                  height: 50,
                  child: Card(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: "Enter Your Name",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Enter Email*',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  width: 500,
                  height: 50,
                  child: Card(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: "Enter Your Email",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Enter Address*',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: Card(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: _address,
                        decoration: const InputDecoration(
                            hintText: "Enter Your Address",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),


                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Date of Birth Day*',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: Card(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: _DateBirthdayController,
                        decoration: const InputDecoration(
                            hintText: "DD/MM/YYYY",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 200,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      validate();
                    },
                    child: const Text('SignUp'),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
