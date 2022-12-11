import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("users");

  Future<void> create({
    required String familyId,
    required String name,
    required String createdBy,
  }) async {
    try {
      _fireCloud.doc(familyId).set(
        {
          'familyId': familyId,
          'name': name,
          'createdAt': DateTime.now(),
          'createdBy': createdBy,
        },
        SetOptions(merge: true),
      );
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error '${e.code}': ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
