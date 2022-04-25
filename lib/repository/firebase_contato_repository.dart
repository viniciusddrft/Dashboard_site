import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/contato_model.dart';

class FirebaseContact {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<CollectionReference<ModelContato>> loadContacts() async =>
      firestore.collection('/contato').withConverter<ModelContato>(
            fromFirestore: (snapshots, _) =>
                ModelContato.fromJson(snapshots.data()!),
            toFirestore: (contactpostmodel, _) => contactpostmodel.toJson(),
          );
}
