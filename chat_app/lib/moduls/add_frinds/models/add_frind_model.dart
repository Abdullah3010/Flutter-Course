class AddFrindModel {
  final String uId;
  final String name;
  final String? image;

  AddFrindModel({
    required this.uId,
    required this.name,
    this.image,
  });

  factory AddFrindModel.fromJson(Map<String, dynamic> json) {
    return AddFrindModel(
      uId: json['uid'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uId,
      'name': name,
      'image': image,
    };
  }
}
