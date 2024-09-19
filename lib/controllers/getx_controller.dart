import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/user_model.dart';

class ApiController extends GetxController{
  final String baseUrl= "https://api.github.com/users";

  RxList<UserModel> userList = RxList<UserModel>();
  RxBool isLoading=false.obs;


  // This method is automatically called when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    getApi();// Call the API when the controller is initialized
  }

  void getApi() async{
    isLoading.value=true;
    var url=Uri.parse(baseUrl);
    final response= await http.get(url);

    final userData=jsonDecode(response.body);
    if(response.statusCode==200){
        for(var user in userData){
          userList.add(UserModel.fromJson(user));
        }
        // print(userList);
      isLoading.value=false;
    }
    else{
      print("something went wrong ❌");
    }

  }

}