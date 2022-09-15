import 'package:contact/utils/colors/my_colors.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

Widget deleteButton(int id) {
  return RoundedButton(
        color: MyColors.red,
          func: () {
           
          },
          titleButton: 'Delete');
  

}
