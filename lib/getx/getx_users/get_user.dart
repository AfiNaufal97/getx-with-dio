import 'package:contact/model/users/employee.dart';
import 'package:contact/service/users/users_service.dart';
import 'package:get/state_manager.dart';

class GetUser extends GetxController{
  RxBool loading = false.obs;
  RxList<Employee> empolyee = <Employee>[].obs;
  RxString exception = ''.obs;
  Rx<Employee> singleEmployee = Employee(email: '', id: 0, avatar: '', first_name: '', last_name: '').obs;

  Future<void> getEmployess()async{
    loading.value = true;
    try{
      var res = await UsersService().getListUser();
      empolyee.value = res;
      print(empolyee.value.toString());
       loading.value = false;
    }catch(e){
      exception.value = e.toString();
    }
  }

  Future<void> getById(int id)async{
    loading.value = true;
    try{
      var res = await UsersService().getSingleUser(id);
      singleEmployee.value = res;
      loading.value = false;
    }catch(e){
      exception.value = e.toString();
    }
  }
}