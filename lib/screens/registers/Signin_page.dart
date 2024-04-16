import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'otpverification_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
  static String verify = "";
}

class _SignInState extends State<SignIn> {
  TextEditingController phoneController = TextEditingController();

  storeNumber() async {
    final prefs = await SharedPreferences.getInstance();
    int numberValue = int.tryParse(phoneController.text) ?? 0;
    prefs.setInt('number', numberValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 48),
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            const Text("OYO", style: TextStyle(
                  fontSize: 32,
                  color: Colors.green,
                  fontWeight: FontWeight.w800),
            ),
            Container(
              width: 80,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("en", style: TextStyle(fontSize: 15)),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
            ),
          ]),

          Column(
            children: [
              Lottie.network(
                  "https://assets9.lottiefiles.com/packages/lf20_JXUInT.json", width: 220),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BOOK",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 7,),
                  Text("HotelHub",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'IN',
                dropdownIconPosition: IconPosition.trailing,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8,)),
                    padding: const EdgeInsets.only(
                      left: 120,
                      right: 120,
                    )
                ),
                // onPressed: () async {
                //   var phone = phoneController.text;
                //   print(phone);
                //   try {
                //     await FirebaseAuth.instance.verifyPhoneNumber(
                //       phoneNumber: phone,
                //       verificationCompleted: (PhoneAuthCredential credential) {},
                //       verificationFailed: (FirebaseAuthException e) {
                //         Fluttertoast.showToast(msg: "Verification Failed: ${e.message}");
                //       },
                //       codeSent: (String verificationId, int? forceResendingToken) {
                //         SignIn.verify = verificationId;
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => OtpVerification(phoneNumber: verificationId),
                //           ),
                //         );
                //       },
                //       codeAutoRetrievalTimeout: (String verificationId) {},
                //     );
                //   } catch (e) {
                //     Fluttertoast.showToast(msg: "OTP Failed");
                //   }
                // },
                // onPressed: ()async{
                //   await FirebaseAuth.instance.verifyPhoneNumber(
                //     phoneNumber: "${}",
                //       verificationCompleted: (phoneAuthCredential) {
                //
                //   }, verificationFailed: (error) {
                //
                //   }, codeSent: (verificationId, forceResendingToken) {
                //
                //   }, codeAutoRetrievalTimeout: (verificationId) {
                //
                //   },);
                //   try{}catch(e){
                //
                //   }
                // },




                child: const Text("Continue"),
              ),

              const SizedBox(height: 15,),
              const Row(
                children: [
                  Expanded(
                      child: Divider(indent: 45.0, endIndent: 5, thickness: 1,)),
                  Text(
                    "OR",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                      child: Divider(indent: 5.0, endIndent: 45.0, thickness: 1,)),
                ],
              ),

              const SizedBox(height: 15,),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/images/img.png", width: 40,),
                    const Text(
                      "Continue with Goggle",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30,),
              Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/call.png",
                      width: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Text(
                        "One tab login with Trucaller",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
