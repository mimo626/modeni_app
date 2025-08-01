import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:modeni_app/features/questions_list/data/model/answer_model.dart';
import 'package:modeni_app/features/questions_list/data/model/question_model.dart';
import 'package:modeni_app/features/user/data/model/user_model.dart';



final logger = Logger();

class QuestionDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8080", // API 서버 주소
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true, // 응답 본문까지 출력
      error: true,
    ),
  );

  /// 오늘의 질문
  Future<QuestionModel> getTodayQuestion(String familyCode) async {
    try {
      final response = await dio.get('/questions/today/' + familyCode);

      if (response.statusCode == 200) {
        dynamic data = response.data;

        final question = await QuestionModel.fromJson(data);
        logger.i("오늘의 질문 가져오기 성공");
        return question;
      } else {
        throw Exception('오늘의 질문 가져오기 실패');
      }
    } catch (e) {
      logger.e("오늘의 질문 가져오기 실패: $e");
      throw Exception("오늘의 질문 가져오기 중 오류 발생: $e");
    }
  }

  /// 가족 질문리스트
  Future<List<QuestionModel>> getFamilyQuestions() async {
    try {
      final response = await dio.get('/user-daily-questions/initial-questions');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final list = await data.map((item) => QuestionModel.fromJson(item)).toList();

        logger.i("질문들 가져오기 성공");
        return list;
      } else {
        throw Exception('질문들 가져오기 실패');
      }
    } catch (e) {
      logger.e("질문 리스트 가져오기 실패: $e");
      throw Exception("질문 리스트 가져오기 중 오류 발생: $e");
    }

  }

  ///가족별 답변 저장
  Future<AnswerModel> createAnswer(int questionId, int userId, String content) async {
    try {
      final response = await dio.post('/answer', data:
      {
        "questionId": questionId,
        "userId": userId,
        "content": content
      }
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;

        final int id = data['id'];
        final String createdAtString = data['created_at'];
        final DateTime createdAt = DateTime.parse(createdAtString);

        final answerModel = AnswerModel(
            id: id, questionId: questionId, userId: userId,
            content: content, createdAt: createdAt);

        logger.i("오늘의 질문 가져오기 성공");
        return answerModel;
      } else {
        throw Exception('오늘의 질문 가져오기 실패');
      }
    } catch (e) {
      logger.e("오늘의 질문 가져오기 실패: $e");
      throw Exception("오늘의 질문 가져오기 중 오류 발생: $e");
    }
  }
}
