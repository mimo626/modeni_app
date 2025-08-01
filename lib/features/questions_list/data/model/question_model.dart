class QuestionModel {
  final int id;
  final String content;
  final int familyId;
  final DateTime createdAt;

  QuestionModel({
    required this.id,
    required this.content,
    required this.familyId,
    required this.createdAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json['id'],
    content: json['content'],
    familyId: json['family_id'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'family_id': familyId,
    'created_at': createdAt.toIso8601String(),
  };
}
