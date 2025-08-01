class AnswerModel {
  final int id;
  final int questionId;
  final int userId;
  final String content;
  final DateTime createdAt;

  AnswerModel({
    required this.id,
    required this.questionId,
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
    id: json['id'],
    questionId: json['question_id'],
    userId: json['user_id'],
    content: json['content'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'question_id': questionId,
    'user_id': userId,
    'content': content,
    'created_at': createdAt.toIso8601String(),
  };
}
