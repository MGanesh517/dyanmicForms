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

  final RxInt _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  final RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }
}