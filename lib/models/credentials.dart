class Credentials {
  final String email;
  final String password;
  Credentials({this.email, this.password});

  Map toMap() {
    var map = new Map();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}
