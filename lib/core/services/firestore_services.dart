import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hup/core/services/data_services.dart';
import 'package:fruits_hup/features/auth/data/models/user_model.dart';
import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }
}
