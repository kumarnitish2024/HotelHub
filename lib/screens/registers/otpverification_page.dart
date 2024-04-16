import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import Shared Preferences
import 'package:oyo/screens/registers/register_page.dart';
import 'package:oyo/screens/registers/checkuser_exists.dart';
import '../home/home_page.dart';
import 'Signin_page.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNumber;

  const OtpVerification({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late SharedPreferences _prefs; // SharedPreferences instance

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  // Initialize SharedPreferences instance
  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              width: 450,
              height: 370,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/images/phoneotp.png", width: 90),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("OTP Verification", style: TextStyle(fontSize: 19)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Pinput(
                        keyboardType: TextInputType.number,
                        controller: pinController,
                        length: 6,
                        showCursor: true,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(horizontal: 40), // Adjust padding as needed
                        ),
                        onPressed: () async {
                          try {
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                              verificationId: SignIn.verify,
                              smsCode: pinController.text,
                            );
                            // Sign in the user with the credential
                            await auth.signInWithCredential(credential);
                            var uId = FirebaseAuth.instance.currentUser?.uid;
                            await storeUserId(uId!); // Call storeUserId with the user ID
                            // Check if user exists and navigate accordingly
                            final userExists = await checkUserExists(uId);
                            if (userExists) {
                              print(userExists);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                            } else {
                              print("error");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPages()));
                            }
                            Fluttertoast.showToast(msg: "Login successful");
                          } catch (e) {
                            Fluttertoast.showToast(msg: "Enter Valid OTP");
                          }
                        },
                        child: const Text("Verify OTP"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> storeUserId(String userId) async {
    try {
      // Save UID to SharedPreferences
      await _prefs.setString('userId', userId);
    } catch (e) {
      print('Error storing user ID: $e');
    }
  }
}