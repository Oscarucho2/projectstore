import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

  FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

    
  Future<void> registerUser(String email, String username, String password) async {
    await _db.collection("users").add({
      "email": email,
      "username": username,
      "password": password,
    });
  }

Future<bool> areCredentialsValid(String username, String password) async {
  try {
    QuerySnapshot usersQuery = await usersCollection.get();

    List<Map<String, dynamic>> allUsers = usersQuery.docs
        .map((DocumentSnapshot userDoc) => userDoc.data() as Map<String, dynamic>)
        .toList();

    bool credentialsMatch = allUsers.any((user) =>
        user['username'] == username && user['password'] == password);
    return credentialsMatch;
  } catch (error) {
    print("Error al validar credenciales: $error");
    return false;
  }
}


}
