import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class UserRepository {
  final _fireCloud = FirebaseFirestore.instance.collection("users");
  DateTime now = DateTime.now();

  Future<void> create({
    required String userId,
    required String name,
    required String email,
  }) async {
    try {
      await _fireCloud.doc(userId).set({
        "userId": userId,
        "name": name,
        "email": email,
        "status": "Hello",
        "imageUrl":
            "https://firebasestorage.googleapis.com/v0/b/famizer-abc23.appspot.com/o/default.jpg?alt=media&token=7eb9e167-b6b1-4db6-80c5-97648753e8a9",
        "date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "mood": "Senang",
        "birthday": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "timestamp": FieldValue.serverTimestamp(),
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
