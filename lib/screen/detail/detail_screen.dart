import 'package:contact/getx/getx_users/get_user.dart';
import 'package:contact/model/users/employee.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  int id;

  DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}



class _DetailScreenState extends State<DetailScreen> {
  var detail = Get.put(GetUser());
  Employee? employee = null;

  Widget profile() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: MyColors.navy,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            ()=> Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(detail.singleEmployee.value.avatar))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            ()=> Text(
              '${detail.singleEmployee.value.first_name} ${detail.singleEmployee.value.first_name}' ,
              style:
                  MyFonts.semiBold.copyWith(color: MyColors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }


  void detailEmployee()async{
      await detail.getById(widget.id);
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailEmployee();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail'),
        actions: [
         
        ],
      ),
      body: profile(),
    );
  }
}
