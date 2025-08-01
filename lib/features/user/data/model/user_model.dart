class UserModel {
  final int id;
  final String user_id;
  final String password;
  final String name;
  final String role;
  final String region;
  final String family_code;
  final String age;

  UserModel({
    required this.id,
    required this.user_id,
    required this.password,
    required this.name,
    required this.role,
    required this.region,
    required this.family_code,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      user_id: json['userId'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      region: json['region'] as String? ?? '',
      family_code: json['familyCode'] as String? ?? '',
      age: json['age'].toString() ?? '', // 혹시 int일 수도 있어서 toString() 처리
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': user_id,
      'password': password,
      'name': name,
      'age': age,
      'role': role,
      'region': region,
      'familyCode': family_code,
    };
  }
}
