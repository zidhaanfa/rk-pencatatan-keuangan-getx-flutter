import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/local/my_shared_pref.dart';

class HomeController extends GetxController {
  final name = 'User'.obs;
  final email = ''.obs;

  @override
  void onInit() {
    var user = MySharedPref.getUser();
    name.value = user['name']!;
    super.onInit();
  }
}
