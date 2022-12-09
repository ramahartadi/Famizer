class User {
  final String? id;
  final String? nama;
  final String? tanggalUlangTaun;
  final String? status;
  final String? mood;

  User(
      {required this.id,
      required this.nama,
      required this.status,
      required this.tanggalUlangTaun,
      this.mood = "Sangat Senang"});
}

var userProfile = User(
  id: '01',
  nama: 'Ahmad',
  status: 'Sedang sibuk',
  tanggalUlangTaun: '2000-01-01',
  mood: "Sangat Senang",
);
