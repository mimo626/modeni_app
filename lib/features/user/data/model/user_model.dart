class UserModel {
  final String user_id;
  final String password;
  final String name;
  final String role;
  final String region;
  final BigInt family_code;
  final DateTime? created_at;
  final String age;

  UserModel({
    required this.user_id,
    required this.password,
    required this.name,
    required this.role,
    required this.region,
    required this.family_code,
    this.created_at,
    required this.age,
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
