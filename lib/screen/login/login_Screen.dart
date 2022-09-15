import 'package:contact/getx/getx_auth/get_auth.dart';
import 'package:flutter/material.dart';
import '../../navigation/routes.dart';
import '../../utils/fonts/my_fonts.dart';
import 'package:get/get.dart';
import '../../widgets/form_input.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_button_widget.dart';

class LoginScreen extends StatelessWidget {

    var login = Get.put(GetAuth());
   LoginScreen({Key? key}) : super(key: key);

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
              controller: login.email,
              title: 'email',
              hint: 'example : name@mail.com',
            ),
            const SizedBox(
              height: 30,
            ),
            FormInput(
              controller: login.password,
              title: 'password',
              hidden: true,
              hint: '******',
            ),
            const SizedBox(
              height: 50,
            ),
           RoundedButton(
                  func: () {
                    login.loginUser();
                     if(login.registerModel.value != null){
                  Get.offAllNamed(Routes.home);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
                }
                  },
                  titleButton: 'Login'),
            const SizedBox(
              height: 10,
            ),
            TextButtonWidget(
              text: 'Belum Punya Akun? ',
              textButton: 'Register',
              func: () => Get.back(),
            )
          ],
        ),
      ),
    );
  }
}
