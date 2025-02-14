class AppUser {
  final String uid;
  final String email;
  final String name;

  const AppUser({
    required this.uid,
    required this.email,
    required this.name,
  });

  // convert user data to json format
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  // convert json to user data format
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uid: jsonUser['uid'] ?? '', // Si 'uid' est null, met une chaîne vide
      email: jsonUser['email'] ?? '',
      name: jsonUser['name'] ?? '',
    );
  }
}
