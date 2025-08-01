class Family {
  final int id;
  final String familyCode;
  final String motto;

  Family({
    required this.id,
    required this.familyCode,
    required this.motto,
  });

  factory Family.fromJson(Map<String, dynamic> json) => Family(
    id: json['id'],
    familyCode: json['family_code'],
    motto: json['motto'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'family_code': familyCode,
    'motto': motto,
  };
}
