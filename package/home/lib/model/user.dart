class UserModel {
  final String? id;
  final String? name;
  final String? birthday;
  final String? status;
  final String? mood;

  UserModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.birthday,
      this.mood = "Sangat Senang"});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'birthday': birthday,
        'status': status,
        'mood': mood,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      birthday: json['birhday'],
      mood: json['mood']);
}

var userProfile = UserModel(
  id: '01',
  name: 'Ahmad',
  status: 'Sedang sibuk',
  birthday: '2000-01-01',
  mood: "Sangat Senang",
);
