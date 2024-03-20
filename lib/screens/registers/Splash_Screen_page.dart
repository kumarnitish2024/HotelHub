import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oyo/screens/buttonnavigations_view/bottomnavigationbar.dart';
import 'Signin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3),
  //           ()=>Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder:
  //               (context) =>SignIn()
  //           )
  //       )
  //   );
  // }
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // if the user is already Login to Send ButtonNavigation Page//
      _isUserLogin().then((value) {
        if (value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) => const ButtonNavigation()));
        }
        else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SignIn()));
        }
      });
    });
  }

  Future<bool> _isUserLogin() async {
    var loginStatus = FirebaseAuth.instance.currentUser?.uid;
    if (loginStatus != null) {
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 100, ),
            child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_C7yLqM.json",width: 130),
          ),
         Padding(padding: EdgeInsets.only(left: 120, top: 30),
           child: Text("BOOK HOTELS \n AT 24 HOURS",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30 ),),
         ),
        ],
      ),
    );
  }
}
