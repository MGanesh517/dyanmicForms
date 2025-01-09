
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Screens/login/login_controller.dart';

enum DialogWidthF {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
}

enum DialogHeightF {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
  fitContent,
}

class LogoutDialog extends StatelessWidget {
  final DialogWidthF dialogWidth;
  final double? customWidth;
  final double? maxWidthPercentage;
  final double? minWidth;

  final DialogHeightF dialogHeight;
  final double? customHeight;
  final double? maxHeightPercentage;
  final double? minHeight;

  LogoutDialog({
    super.key,
    required this.dialogWidth,
    this.customWidth,
    this.maxWidthPercentage,
    this.minWidth,
    required this.dialogHeight,
    this.customHeight,
    this.maxHeightPercentage,
    this.minHeight,
  });
  
  final loginController = Get.put(LoginController());

  double getDialogWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = _calculateTargetWidth(screenWidth);
    double maxWidth = screenWidth * (maxWidthPercentage ?? 0.9);
    double constrainedWidth = targetWidth.clamp(
      minWidth ?? _getDefaultMinWidth(screenWidth), 
      maxWidth
    );
    return constrainedWidth;
  }

  double _calculateTargetWidth(double screenWidth) {
    switch (dialogWidth) {
      case DialogWidthF.extraSmall:
        return screenWidth * 0.4;
      case DialogWidthF.small:
        return screenWidth * 0.5;
      case DialogWidthF.medium:
        return screenWidth * 0.6;
      case DialogWidthF.large:
        return screenWidth * 0.75;
      case DialogWidthF.extraLarge:
        return screenWidth * 0.9;
      case DialogWidthF.custom:
        return customWidth ?? (screenWidth * 0.6);
    }
  }

  double _getDefaultMinWidth(double screenWidth) {
    return screenWidth * 0.3;
  }

  double? getDialogHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (dialogHeight == DialogHeightF.fitContent) {
      return null;
    }
    double targetHeight = _calculateTargetHeight(screenHeight);
    double maxHeight = screenHeight * (maxHeightPercentage ?? 0.9);
    double constrainedHeight = targetHeight.clamp(
      minHeight ?? _getDefaultMinHeight(screenHeight),
      maxHeight
    );
    return constrainedHeight;
  }

  double _calculateTargetHeight(double screenHeight) {
    switch (dialogHeight) {
      case DialogHeightF.extraSmall:
        return screenHeight * 0.25;
      case DialogHeightF.small:
        return screenHeight * 0.35;
      case DialogHeightF.medium:
        return screenHeight * 0.5;
      case DialogHeightF.large:
        return screenHeight * 0.65;
      case DialogHeightF.extraLarge:
        return screenHeight * 0.85;
      case DialogHeightF.custom:
        return customHeight ?? (screenHeight * 0.5);
      case DialogHeightF.fitContent:
        return 0;
    }
  }

  double _getDefaultMinHeight(double screenHeight) {
    return screenHeight * 0.2;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: getDialogWidth(context),
          maxWidth: getDialogWidth(context),
          minHeight: getDialogHeight(context) ?? 0,
          maxHeight: getDialogHeight(context) ?? double.infinity,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.logout_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ),
              const SizedBox(height: 20),

              Text(
                "Logout Confirmation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 15),

              Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "You'll miss out on notifications, updates, and personalized recommendations.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      // loginController.logout();
                      Future.delayed(Duration.zero, () {
                      loginController.logout().then((val) {
                        // dashBoardController.changeTabIndex(0);
                      });
                    });
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => LogoutDialog(
        dialogWidth: MediaQuery.of(context).size.width <= 600 
          ? DialogWidthF.large 
          : DialogWidthF.extraSmall,
        dialogHeight: DialogHeightF.fitContent,
      ),
      barrierDismissible: true,
    );
  }
}