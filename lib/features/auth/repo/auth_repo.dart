import 'dart:developer';

import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';

class AuthRepo {
 Future login(String username, String password) async {
   final response = await DioHelper.postRequest(
     endPoint: ApiEndpoints.login,
     data: {
       'username': username,
       'password': password,
     },
   );
   if (response.statusCode == 200) {
     LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data);
     return loginResponseModel;
     
   }
   else{
    log(response.data.toString());
   }
 }
}
