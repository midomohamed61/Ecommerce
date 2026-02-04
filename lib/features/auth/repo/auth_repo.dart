import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';

class AuthRepo {
  DioHelper _dioHelper;

  AuthRepo(this._dioHelper);
 Future <Either<String, LoginResponseModel>> login(String username, String password) async {

  try {
   final response = await _dioHelper.postRequest(
     endPoint: ApiEndpoints.login,
     data: {
       'username': username,
       'password': password,
     },
   );
   if (response.statusCode == 200 || response.statusCode == 201) {
     LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data);
     return right(loginResponseModel);
     
   }
   else{
    return left(response.toString());
   }
  } catch (error) {
    if (error is DioException) {
      return left(error.message.toString());
    }
    return left(error.toString());
  }
 }
}
