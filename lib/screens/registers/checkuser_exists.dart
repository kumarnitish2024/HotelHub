import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkUserExists(String uid) async {
  bool userExists = false;
  try {
    var userSnapshot = await FirebaseFirestore.instance.collection('users').where("user_id",isEqualTo: uid).get();
    userExists = userSnapshot.docs.isEmpty;
  } catch (e) {
    print('Error checking user existence: $e');
  }
  return userExists;
}

// Future<bool> checkUserExists(String uid) async {
//   final usersCollection = FirebaseFirestore.instance.collection('users');
//   final querySnapshot = await usersCollection
//       .where('phoneNumber', isEqualTo: uid)
//       .get();
//
//   return querySnapshot.docs.isNotEmpty;
// }