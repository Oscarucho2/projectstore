import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

  FirebaseFirestore _db = FirebaseFirestore.instance;
   FirebaseFirestore db = FirebaseFirestore.instance;
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

Future<List<Map<String, dynamic>>> getProductosPorCategoria(String categoria) async {
try {
    // Obtén la referencia a la colección principal
    CollectionReference productsCollection = db.collection('products');

    // Obtén los productos de 'producto1' de la categoría específica
    CollectionReference subcollectionReference1 =
        productsCollection.doc(categoria).collection('producto1');
    QuerySnapshot productsQuery1 = await subcollectionReference1.get();
    List<Map<String, dynamic>> productos1 = productsQuery1.docs
        .map((productDoc) => productDoc.data() as Map<String, dynamic>)
        .toList();

    // Obtén los productos de 'producto2' de la categoría específica
    CollectionReference subcollectionReference2 =
        productsCollection.doc(categoria).collection('producto2');
    QuerySnapshot productsQuery2 = await subcollectionReference2.get();
    List<Map<String, dynamic>> productos2 = productsQuery2.docs
        .map((productDoc) => productDoc.data() as Map<String, dynamic>)
        .toList();

    // Combina las dos listas de productos
    List<Map<String, dynamic>> allProducts = [];
    allProducts.addAll(productos1);
    allProducts.addAll(productos2);

    return allProducts;
  } catch (error) {
    print("Error al obtener productos: $error");
    return [];
  }
}


}
