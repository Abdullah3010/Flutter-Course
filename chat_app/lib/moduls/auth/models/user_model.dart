class UserModel {
  String? uid;
  final String name;
  final String phone;
  final String email;
  final String password;
  String? image;

  UserModel({
    this.uid,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}
