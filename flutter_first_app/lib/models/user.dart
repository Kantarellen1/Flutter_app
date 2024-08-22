class User {
  final int id;
  final String email;
  final String username;

  const User({
    required this.id,
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Assuming the json object always contains the expected keys
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
    );
  }

  // An empty User object factory for cases where you need a default User
  factory User.empty() {
    return const User(
      id: 0,
      email: '',
      username: '',
    );
  }
}
