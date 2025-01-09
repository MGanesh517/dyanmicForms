import 'package:get/get.dart';
import 'package:implementation_panel/Screens/Dashboard/drawer_controller.dart';
 
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DrawerControllerX(), permanent: true);
    // Get.put<LoginController>(LoginController(), permanent: true);
    // Get.put<RetailersController>(RetailersController(), permanent: true);
    // Get.put<CartController>(CartController(), permanent: true);
  }
}
 