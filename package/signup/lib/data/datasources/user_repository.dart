import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("users");

  Future<void> create({
    required String userId,
    required String name,
    required String email,
  }) async {
    try {
      await _fireCloud.add({
        "userId": userId,
        "name": name,
        "email": email,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
