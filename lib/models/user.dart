import 'package:intl/intl.dart';

class User {
  final int id;
  final String lastName;
  final String firstName;
  final String email;
  final String birthDay;
  final String gender;
  final String bio;
  final String image;
  User(
      {this.id,
      this.lastName,
      this.firstName,
      this.email,
      this.birthDay,
      this.gender,
      this.bio,
      this.image});

  String formatedDate() {
    return DateFormat.yMMMMEEEEd().format(DateTime.tryParse(birthDay));
  }

  Map toJson() {
    Map map = new Map();
    map["id"] = id;
    map["lastname"] = lastName;
    map["firstname"] = firstName;
    map["email"] = email;
    map["birthday"] = birthDay;
    map["bio"] = bio;
    map["gender"] = gender;
    map["image_path"] = image;
    return map;
  }

  static User build(Map<String, dynamic> fetchResults) {
    return User(
      id: fetchResults["id"],
      lastName: fetchResults["lastname"],
      firstName: fetchResults["firstname"],
      email: fetchResults["email"],
      birthDay: fetchResults["birthday"].toString(),
      gender: fetchResults["gender"],
      bio: fetchResults["bio"],
      image: fetchResults["image_path"],
    );
  }
}
