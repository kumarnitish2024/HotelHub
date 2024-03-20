import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:oyo/screens/registers/Splash_Screen_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   const MainScre
//
//   import 'package:flutter/material.dart';
//   import 'package:oyo/screens/registers/Splash_Screen_page.dart';
//
//   Future<void> main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     runApp(const MyApp());
//   }
//
//   class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//   return const MaterialApp(
//   debugShowCheckedModeBanner: false,
//   home: SplashScreen(),
//   );
//   }
//   }



// void main() {
//   final list1 = List<int>.filled(5, 0);
//   list1[0] = 10;
//   list1[1] = 11;
//   list1[2] = 12;
//   list1[3] = 13;
//   list1[4] = 14;
//   print(list1);
// }
