
import 'package:contact/getx/getx_auth/get_auth.dart';
import 'package:contact/screen/home/home_screen.dart';
import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:contact/widgets/form_input.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:contact/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigation/routes.dart';

class RegisterScreen extends StatefulWidget {

   RegisterScreen({Key? key}) : super(key: key);  

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var register = Get.put(GetAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
            children: [
              Text(
                "Let’s\nGet Started",
                style: MyFonts.bold.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 30,
              ),
              FormInput(
                  controller: register.email,
                  title: 'email',
                  hint: 'example : name@gmail.com'),
              const SizedBox(
                height: 30,
              ),
              FormInput(
                controller: register.password,
                title: 'password',
                hidden: true,
                hint: "*****",
              ),
              const SizedBox(
                height: 50,
              ),

              RoundedButton(func: (){
                register.registerUser();
                if(register.registerModel.value != null){
                  Get.offAllNamed(Routes.home);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
                }
              }, titleButton: 'Register'),
             
              const SizedBox(
                height: 10,
              ),
              TextButtonWidget(
                text:"Sudah punya akun ?" ,
                textButton: 'Login',
                func: () => Get.toNamed(Routes.login),
              )
            ],
          ),
        ),
    
    );
  }
}
