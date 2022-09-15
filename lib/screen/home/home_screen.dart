import 'package:contact/model/users/employee.dart';
import 'package:contact/screen/create/create_screen.dart';
import 'package:contact/screen/detail/detail_screen.dart';
import 'package:contact/screen/home/widgets/list_user.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx/getx_users/get_user.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user = Get.put(GetUser());
  List<Employee> employees = [];


  void getEmployee()async{
    await user.getEmployess();
    setState(() {
      employees = user.empolyee.value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Employee'),
        actions: [
          Icon(Icons.login),
          const SizedBox(width: 20,)
        ]
      ),

      body: ListView(
    
        children:employees.map((e) => ListUser(name: e.first_name, image: e.avatar, email: e.email, func: (){
          Get.to(DetailScreen(id: e.id));
        })).toList()
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.navy,
          onPressed: () {
           
           Get.to(CreateScreen(action: 'add'));
          },
          child: const Icon(Icons.add)),
    );
  }
}
