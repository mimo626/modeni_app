class UserModel {
  final String user_id;
  final String password;
  final String name;
  final int age;
  final String role;
  final String region;
  final BigInt family_code;

  UserModel({
    required this.user_id,
    required this.password,
    required this.name,
    required this.age,
    required this.role,
    required this.region,
    required this.family_code,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'password': password,
      'name': name,
      'age': age,
      'role': role,
      'region': region,
      'family_code': family_code,
    };
  }
}
