import 'package:contact/model/auth/login_response.dart';
import 'package:contact/model/auth/register_response.dart';
import 'package:contact/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class GetAuth extends GetxController{
  final RxBool loading = false.obs;
  final RxString exception = ''.obs;
  final RxString token = ''.obs;
  Rx<RegisterResponse> registerModel = RegisterResponse(id: 0, token: 'sdfsfd').obs;
    Rx<LoginResponse> loginModel = LoginResponse(token: '').obs;
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');



   Future<void> registerUser()async{
    loading.value = true;
    try{
      var res = await AuthService().registerEmployee(email.text.toString(), password.text.toString());
      registerModel.value = res;
      AuthService().addToScureStorage(res.token); 
      await getToken();
     loading.value = false;
  
    }catch(e){
      exception.value = e.toString();
    }
  }

   Future<void> loginUser()async{
    loading.value = true;
    try{
      var res = await AuthService().loginEmployee(email.text.toString(), password.text.toString());
      loginModel.value = res;
      AuthService().addToScureStorage(res.token); 
      await getToken();
     loading.value = false;
  
    }catch(e){
      exception.value = e.toString();
    }
  }

  Future<void> getToken()async{
    var value = await AuthService().getToken();
    token.value = value!;
    print('token ${token.value}');
  }



}