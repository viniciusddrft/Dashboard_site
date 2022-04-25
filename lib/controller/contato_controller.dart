import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/contato_model.dart';
import '../repository/firebase_contato_repository.dart';

class ContatoController {
  final FirebaseContact firebaseContact = FirebaseContact();
  late CollectionReference<ModelContato> contacts;

  Future<void> loadContacts() async =>
      contacts = await firebaseContact.loadContacts();
}
