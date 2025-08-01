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

  /// 회원가입
  Future<void> userSignUp(UserModel userModel) async {
    try {
      final response = await dio.post('/auth/signup', data:
      {
        "userId": userModel.user_id,
        "password": userModel.password,
        "username": userModel.name,
        "age": userModel.age,
        "role": userModel.role,
        "region": userModel.region,
        "familyCode": userModel.family_code
      }
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;

        logger.i("유저 회원가입 성공");
        return;
      } else {
        throw Exception('회원가입 실패');
      }
    } catch (e) {
      logger.e("회원가입 실패: $e");
      throw Exception("회원가입 중 오류 발생: $e");
    }
  }

  /// 로그인
  Future<void> userLogin(String userId, String password) async {
    try {
      final response = await dio.post('/auth/login', data:
      {
        "userId": userId,
        "password": password,
      }
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;

        logger.i("유저 로그인 성공");
        return;
      } else {
        throw Exception('회원가입 실패');
      }
    } catch (e) {
      logger.e("회원가입 실패: $e");
      throw Exception("회원가입 중 오류 발생: $e");
    }
  }

  // 로그인된 회원 조회
  Future<UserModel> getLoginUser(String userId) async {
    try {
      final response = await dio.get('', queryParameters:
      {
        "userId": userId,
      }
      );

      if (response.statusCode == 200) {
        dynamic data = response.data;

        logger.i("로그인 유저 조회 성공");
        return UserModel.fromJson(data);
      } else {
        throw Exception('로그인 유저 조회 실패');
      }
    } catch (e) {
      logger.e("로그인 유저 조회 실패: $e");
      throw Exception("로그인 유저 조회 중 오류 발생: $e");
    }
  }
}
