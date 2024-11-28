import 'package:cent/forum_exer/features/auth/dtos/login_dto.dart';
import 'package:cent/forum_exer/features/auth/dtos/login_success_dto.dart';
import 'package:dio/dio.dart';

import '';
class AuthApiClient{
  final Dio dio;

  AuthApiClient(this.dio);
  Future<LoginSuccessDto> login(LoginDto loginDto) async{
    final response= await dio.post('/path/login',data: {
      'username':loginDto.username,
      'password':loginDto.password,
    });
    return LoginSuccessDto.fromJson(response.data);
  }
}