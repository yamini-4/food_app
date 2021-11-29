class User {
  String userName;
  String displayPicture;

  User({required this.userName, required this.displayPicture});

  factory User.fromJson(Map<String, dynamic> json) => User(
      userName: json['user_name'], displayPicture: json['display_picture']);
}
