import 'package:fruits_hup/features/auth/domain/entites/user_entity.dart';

abstract class DatabaseServices {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId});
}
