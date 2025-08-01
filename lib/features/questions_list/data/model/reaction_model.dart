class ReactionModel {
  final int id;
  final int answerId;
  final int userId;
  final String reactionType; // enum: maybe "like", "dislike", etc.
  final DateTime createdAt;

  ReactionModel({
    required this.id,
    required this.answerId,
    required this.userId,
    required this.reactionType,
    required this.createdAt,
  });

  factory ReactionModel.fromJson(Map<String, dynamic> json) => ReactionModel(
    id: json['id'],
    answerId: json['answer_id'],
    userId: json['user_id'],
    reactionType: json['reaction_type'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'answer_id': answerId,
    'user_id': userId,
    'reaction_type': reactionType,
    'created_at': createdAt.toIso8601String(),
  };
}
