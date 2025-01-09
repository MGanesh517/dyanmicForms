import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerControllerX extends GetxController {
  final storage = GetStorage();

  late AnimationController animationController;

  RxBool isPopupMenuVisible = false.obs;
  Rx<int?> currentPopupMenuIndex = Rx<int?>(null);

  final RxBool _isTextNotVisible = false.obs;
  bool get isTextNotVisible => _isTextNotVisible.value;
  set isTextNotVisible(bool value) => _isTextNotVisible.value = value;

  @override
  void onInit() {
    super.onInit();
    isTextNotVisible = storage.read('showText') ?? true;
  }

  void toggleShowText() {
    isTextNotVisible = !isTextNotVisible;
    storage.write('showText', isTextNotVisible);
  }

  void setShowText(bool value) {
    isTextNotVisible = value;
    storage.write('showText', isTextNotVisible);
  }

  final RxBool _isHovered = false.obs;
  bool get isHovered => _isHovered.value;
  set isHovered(bool value) => _isHovered.value = value;

  // final RxBool _isSubItemSelected = false.obs;
  // bool get isSubItemSelected => _isSubItemSelected.value;
  // set isSubItemSelected(bool value) => _isSubItemSelected.value = value;

  final RxInt _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  // In your DrawerControllerX class
  final RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }
}

// import 'package:get/get.dart';

// class DrawerControllerX extends GetxController {
//   final RxBool _isTextVisible = false.obs;
//   final RxBool _isHovered = false.obs;

//   bool get isTextNotVisible => _isTextVisible.value;
//   bool get isHovered => _isHovered.value;

//   void toggleShowText() {
//     _isTextVisible.value = !_isTextVisible.value;
//   }

//   void setHovered(bool value) {
//     _isHovered.value = value;
//   }
// }





// // // controller.dart
// // import 'package:get/get.dart';

// // class DrawerControllerX extends GetxController {
// //   final RxBool _showText = true.obs;
// //   final RxMap<int, RxBool> _hoveredItems = <int, RxBool>{}.obs;

// //   bool get isTextNotVisible => _showText.value;

// //   void setShowText(bool value) {
// //     _showText.value = value;
// //   }

// //   void toggleShowText() {
// //     _showText.value = !_showText.value;
// //   }

// //   bool isHovered(int index) {
// //     return _hoveredItems[index]?.value ?? false;
// //   }

// //   void setHovered(int index, bool value) {
// //     if (!_hoveredItems.containsKey(index)) {
// //       _hoveredItems[index] = false.obs;
// //     }
// //     _hoveredItems[index]?.value = value;
// //   }

// //   @override
// //   void onInit() {
// //     super.onInit();
// //     // Initialize hover states for all drawer items
// //     for (int i = 0; i < 12; i++) { // Adjust the number based on your total drawer items
// //       _hoveredItems[i] = false.obs;
// //     }
// //   }
// // }