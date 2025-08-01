import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:modeni_app/features/user/data/model/user_model.dart';



final logger = Logger();

class UserDatasource {
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

  /// 유저 조회
  Future<void> login(String user_id, String password) async {
    try {
      final response = await dio.post('/auth/signup', data:
      {
        "userId": "papa001",
        "password": "password123",
        "username": "홍길동",
        "age": "35",
        "role": "아빠",
        "region": "서울"
      }
      );

      //TODO nextPage를 받아서 무한 스크롤 가능하게 수정 필요
      if (response.statusCode == 200) {
        dynamic data = response.data;

        //List<Map<String, dynamic>> results = List<Map<String, dynamic>>.from(data["results"]);

        logger.i("유저 로그인 성공");
        return;
      } else {
        throw Exception('뉴스 데이터를 가져오지 못했습니다.');
      }
    } catch (e) {
      logger.e("뉴스 조회 실패: $e");
      throw Exception("뉴스 조회 중 오류 발생: $e");
    }
  }
}
