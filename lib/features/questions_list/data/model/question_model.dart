class QuestionModel {
  final int id;
  final String content;
  final String familyCode;

  QuestionModel({
    required this.id,
    required this.content,
    required this.familyCode,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json['id'] as int? ?? 0,
    content: json['content'] as String? ?? '',
    familyCode: json['familyCode'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'familyCode': familyCode,
  };
}
