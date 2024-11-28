import 'dart:math';

import 'package:cent/forum_exer/features/auth/data/auth_api_client.dart';
import 'package:cent/forum_exer/features/auth/data/auth_local_data_source.dart';
import 'package:cent/forum_exer/features/auth/dtos/login_dto.dart';
import 'package:cent/forum_exer/features/result_type.dart';

class AuthRepository{
  final AuthApiClient authApiClient;
  final AuthLocalDataSource authLocalDataSources;

  AuthRepository({required this.authApiClient,required this.authLocalDataSources});

  Future<Result<void>> login({
    required String username,
    required String password,
  }) async {
    try {
      final loginSuccessDto = await authApiClient.login(
        LoginDto(username: username, password: password),
      );
      // await authLocalDataSource.saveToken(loginSuccessDto.accessToken);
    } catch (e) {
      log('$e' as num);
      return Failure('$e');
    }
    return Success(null);
  }
}