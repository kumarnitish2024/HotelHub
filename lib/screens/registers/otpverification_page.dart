import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oyo/screens/registers/register_page.dart';
import 'package:oyo/screens/buttonnavigations_view/bottomnavigationbar.dart';
import 'package:oyo/checkuser_exists.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Signin_page.dart';

class OtpVerification extends StatefulWidget {
  final phoneNumber;
  OtpVerification({super.key, this.phoneNumber});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  int? number;
  TextEditingController pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  Future getDate() async {
    var sharepref = await SharedPreferences.getInstance();
    setState(() {
      number = sharepref.getInt("number")!;
    });
  }

  storeUid(String uid) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(uid, uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40,top: 200),
        child: Container(
          width: 450,
          height: 370,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17,)),
            child: Column(
              children: [
                Image.asset("assets/images/phoneotp.png",width: 90,),
                const Padding(
                  padding: EdgeInsets.only(top: 5,),
                  child: Text("OTP Verification",style: TextStyle(fontSize: 19),),
                ),

                 Padding(
                  padding: EdgeInsets.all(25),
                  child: Pinput(
                    keyboardType: TextInputType.number,
                    controller: pinController,
                    length: 6,
                    showCursor: true,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

              ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 24,),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10,)),
                        padding: EdgeInsets.only(left: 80,right: 80,) //content padding inside button
                    ),
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: SignIn.verify,
                        smsCode: pinController.text);
                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);

                    var uId =FirebaseAuth.instance.currentUser?.uid;
                    bool userExists = await checkUserExists(uId!);
                    storeUid(uId.toString());
                    if(userExists){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ButtonNavigation()));
                    }else{
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  RegisterPages()));
                    }

                    Fluttertoast.showToast(msg: "Login successful");
                  } catch (e) {
                    Fluttertoast.showToast(msg: "Enter Valid OTP");
                  }
                },
                    child: Text("Verify OTP")),
              )
              ],
            ),
          ),
        ),
      ),
      );
  }
}
