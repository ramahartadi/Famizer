import 'package:home/home.dart';

class User {
  String? id;
  String? nama;
  String? tanggalUlangTaun;
  String? status;
  Enum? mood;

  User(
      {required this.id,
      required this.nama,
      required this.status,
      this.mood = MoodUser.SangatSenang});

  static User userProfile() {
    return User(
        id: '01',
        nama: 'Ahmad',
        status: 'Sedang sibuk',
        mood: MoodUser.SangatSenang);
  }
}
