class User {
  final String? id;
  final String? name;
  final String? birthday;
  final String? status;
  final String? mood;

  User(
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

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      birthday: json['birhday'],
      mood: json['mood']);
}

var userProfile = User(
  id: '01',
  name: 'Ahmad',
  status: 'Sedang sibuk',
  birthday: '2000-01-01',
  mood: "Sangat Senang",
);
