
// import 'package:flutter/material.dart';

// enum DialogAnimationType {
//   scale,
//   fade,
//   slideBottom,
//   slideTop,
//   slideLeft,
//   slideRight,
//   scaleAndFade,
//   rotate,
//   scaleAndSlideBottom,
//   rotateAndFade,
//   zoomIn,
//   zoomOut,
//   spin360
// }

// enum DialogWidth {
//   extraSmall,
//   small,
//   medium,
//   large,
//   extraLarge,
//   custom,
// }

// enum DialogHeight {
//   extraSmall,
//   small,
//   medium,
//   large,
//   extraLarge,
//   custom,
//   fitContent,
// }

// class AnimatedDialog extends StatelessWidget {
//   final Widget title;
//   final Widget content;
//   final Widget? closeButtonTitle;
//   final Widget? saveButtonTitle;
//   final VoidCallback? onSave;
//   final VoidCallback? onClose;
//   final bool showCloseButton;
//   final bool showSaveButton;
//   final DialogAnimationType animationType;
//   final Duration animationDuration;
//   final Duration? autoCloseDuration;
//   final Widget? customContent;

//   final DialogWidth dialogWidth;
//   final double? customWidth;
//   final double? maxWidthPercentage;
//   final double? minWidth;

//   final DialogHeight dialogHeight;
//   final double? customHeight;
//   final double? maxHeightPercentage;
//   final double? minHeight;

//   const AnimatedDialog({
//     super.key,
//     this.title = const Text('Modal Title'),
//     this.content =
//         const Text('This is an example modal with a unique animation.'),
//     this.closeButtonTitle = const Text('Close'),
//     this.saveButtonTitle = const Text('Save'),
//     this.onSave,
//     this.onClose,
//     this.showCloseButton = true,
//     this.showSaveButton = false,
//     this.animationType = DialogAnimationType.scale,
//     this.animationDuration = const Duration(milliseconds: 400),
//     this.autoCloseDuration,
//     this.customContent,
//     this.dialogWidth = DialogWidth.medium,
//     this.customWidth,
//     this.maxWidthPercentage = 0.9,
//     this.minWidth = 300,
//     this.dialogHeight = DialogHeight.fitContent,
//     this.customHeight,
//     this.maxHeightPercentage = 0.9,
//     this.minHeight = 200,
//   })  : assert(
//           dialogWidth != DialogWidth.custom || customWidth != null,
//           'customWidth must be provided when using DialogWidth.custom',
//         ),
//         assert(
//           dialogHeight != DialogHeight.custom || customHeight != null,
//           'customHeight must be provided when using DialogHeight.custom',
//         );

//   double getDialogWidth(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double targetWidth;

//     switch (dialogWidth) {
//       case DialogWidth.extraSmall:
//         targetWidth = 300;
//       case DialogWidth.small:
//         targetWidth = 400;
//       case DialogWidth.medium:
//         targetWidth = 600;
//       case DialogWidth.large:
//         targetWidth = 800;
//       case DialogWidth.extraLarge:
//         targetWidth = 1000;
//       case DialogWidth.custom:
//         targetWidth = customWidth!;
//     }

//     double maxWidth = screenWidth * (maxWidthPercentage ?? 0.9);
//     double constrainedWidth = targetWidth.clamp(minWidth ?? 300, maxWidth);

//     return constrainedWidth;
//   }

//   double? getDialogHeight(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     // If fitContent is selected, return null to allow content-based sizing
//     if (dialogHeight == DialogHeight.fitContent) {
//       return null;
//     }

//     double targetHeight;

//     switch (dialogHeight) {
//       case DialogHeight.extraSmall:
//         targetHeight = 200;
//       case DialogHeight.small:
//         targetHeight = 300;
//       case DialogHeight.medium:
//         targetHeight = 500;
//       case DialogHeight.large:
//         targetHeight = 700;
//       case DialogHeight.extraLarge:
//         targetHeight = 900;
//       case DialogHeight.custom:
//         targetHeight = customHeight!;
//       case DialogHeight.fitContent:
//         return null;
//     }

//     double maxHeight = screenHeight * (maxHeightPercentage ?? 0.9);
//     double constrainedHeight = targetHeight.clamp(minHeight ?? 200, maxHeight);

//     return constrainedHeight;
//   }

//   void show(BuildContext context) {
//     // Show the dialog
//     final overlayEntry = OverlayEntry(
//       builder: (context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               maxWidth: getDialogWidth(context),
//               maxHeight: getDialogHeight(context) ?? double.infinity,
//             ),
//             child: Container(
//               width: getDialogWidth(context),
//               height: getDialogHeight(context),
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     title,
//                     const SizedBox(height: 16),
//                     customContent ?? content,
//                     const SizedBox(height: 24),
//                     // Only show button row if at least one button is visible
//                     if (showCloseButton || showSaveButton)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           if (showCloseButton)
//                             TextButton(
//                               onPressed: () {
//                                 onClose?.call();
//                                 Navigator.of(context).pop();
//                               },
//                               child: closeButtonTitle ?? const Text('Close'),
//                             ),
//                           if (showCloseButton && showSaveButton)
//                             const SizedBox(width: 8),
//                           if (showSaveButton)
//                             ElevatedButton(
//                               onPressed: () {
//                                 onSave?.call();
//                                 Navigator.of(context).pop();
//                               },
//                               child: saveButtonTitle ?? const Text('Save'),
//                             ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     Overlay.of(context).insert(overlayEntry);

//     // Auto-close logic
//     if (autoCloseDuration != null) {
//       Future.delayed(autoCloseDuration!, () {
//         overlayEntry.remove();
//       });
//     }
//   }

//   Widget buildTransition(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     switch (animationType) {
//       case DialogAnimationType.scale:
//         return ScaleTransition(
//           scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
//           child: child,
//         );
//       case DialogAnimationType.fade:
//         return FadeTransition(opacity: animation, child: child);
//       case DialogAnimationType.slideBottom:
//         return SlideTransition(
//           position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//               .animate(animation),
//           child: child,
//         );
//       case DialogAnimationType.slideTop:
//         return SlideTransition(
//           position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
//               .animate(animation),
//           child: child,
//         );
//       case DialogAnimationType.slideLeft:
//         return SlideTransition(
//           position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
//               .animate(animation),
//           child: child,
//         );
//       case DialogAnimationType.slideRight:
//         return SlideTransition(
//           position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
//               .animate(animation),
//           child: child,
//         );
//       case DialogAnimationType.scaleAndFade:
//         return ScaleTransition(
//           scale: animation,
//           child: FadeTransition(opacity: animation, child: child),
//         );
//       case DialogAnimationType.rotate:
//         return RotationTransition(
//           turns: Tween<double>(begin: 0, end: 1).animate(animation),
//           child: child,
//         );
//       case DialogAnimationType.scaleAndSlideBottom:
//         return ScaleTransition(
//           scale: animation,
//           child: SlideTransition(
//             position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//                 .animate(animation),
//             child: child,
//           ),
//         );
//       case DialogAnimationType.rotateAndFade:
//         return RotationTransition(
//           turns: Tween<double>(begin: 0, end: 1).animate(animation),
//           child: FadeTransition(opacity: animation, child: child),
//         );
//       case DialogAnimationType.zoomIn:
//         return ScaleTransition(
//           scale: Tween<double>(begin: 0.5, end: 1.0).animate(
//               CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
//           child: child,
//         );

//       case DialogAnimationType.zoomOut:
//         return ScaleTransition(
//           scale: Tween<double>(begin: 1.2, end: 1.0).animate(
//               CurvedAnimation(parent: animation, curve: Curves.easeInBack)),
//           child: child,
//         );

//       case DialogAnimationType.spin360:
//         return RotationTransition(
//           turns: Tween<double>(begin: 0, end: 1).animate(
//               CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
//           child: child,
//         );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox.shrink();
//   }
// }




import 'package:flutter/material.dart';

enum DialogAnimationType {
  scale,
  fade,
  slideBottom,
  slideTop,
  slideLeft,
  slideRight,
  scaleAndFade,
  rotate,
  scaleAndSlideBottom,
  rotateAndFade,
  zoomIn,
  zoomOut,
  spin360
}

enum DialogWidth {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
}

enum DialogHeight {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  custom,
  fitContent,
}

class AnimatedDialog extends StatefulWidget {
  final String title;
  final String message;
  final String subtitle;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback? onConfirm;
  final DialogAnimationType animationType;
  final Duration animationDuration;
  final DialogWidth dialogWidth;
  final double? customWidth;
  final double? maxWidthPercentage;
  final double? minWidth;
  final DialogHeight dialogHeight;
  final double? customHeight;
  final double? maxHeightPercentage;
  final double? minHeight;
  final bool barrierDismissible;
  final Widget? customContent;

  const AnimatedDialog({
    Key? key,
    this.title = 'Confirmation',
    this.message = 'Are you sure?',
    this.subtitle = "This action cannot be undone.",
    this.cancelButtonText = 'Cancel',
    this.confirmButtonText = 'Confirm',
    this.onConfirm,
    this.animationType = DialogAnimationType.scale,
    this.animationDuration = const Duration(milliseconds: 400),
    this.dialogWidth = DialogWidth.medium,
    this.customWidth,
    this.maxWidthPercentage = 0.9,
    this.minWidth = 300,
    this.dialogHeight = DialogHeight.fitContent,
    this.customHeight,
    this.maxHeightPercentage = 0.9,
    this.minHeight = 200,
    this.barrierDismissible = true,
    this.customContent,
  }) : super(key: key);

  static Future<void> show({
    required BuildContext context,
    String title = 'Confirmation',
    String message = 'Are you sure?',
    String subtitle = "This action cannot be undone.",
    String cancelButtonText = 'Cancel',
    String confirmButtonText = 'Confirm',
    VoidCallback? onConfirm,
    DialogAnimationType animationType = DialogAnimationType.scale,
    Duration animationDuration = const Duration(milliseconds: 400),
    DialogWidth? dialogWidth,
    double? customWidth,
    double? maxWidthPercentage,
    double? minWidth,
    DialogHeight? dialogHeight,
    double? customHeight,
    double? maxHeightPercentage,
    double? minHeight,
    bool barrierDismissible = true,
    Widget? customContent,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: animationDuration,
      pageBuilder: (context, _, __) {
        final defaultDialogWidth = MediaQuery.of(context).size.width <= 600
            ? DialogWidth.large
            : DialogWidth.extraSmall;

        return AnimatedDialog(
          title: title,
          message: message,
          subtitle: subtitle,
          cancelButtonText: cancelButtonText,
          confirmButtonText: confirmButtonText,
          onConfirm: onConfirm,
          animationType: animationType,
          animationDuration: animationDuration,
          dialogWidth: dialogWidth ?? defaultDialogWidth,
          customWidth: customWidth,
          maxWidthPercentage: maxWidthPercentage,
          minWidth: minWidth,
          dialogHeight: dialogHeight ?? DialogHeight.fitContent,
          customHeight: customHeight,
          maxHeightPercentage: maxHeightPercentage,
          minHeight: minHeight,
          barrierDismissible: barrierDismissible,
          customContent: customContent,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return _buildAnimatedContent(animation, child, animationType);
      },
    );
  }

  static Widget _buildAnimatedContent(
    Animation<double> animation,
    Widget child,
    DialogAnimationType animationType,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    );

    switch (animationType) {
      case DialogAnimationType.scale:
        return ScaleTransition(scale: curvedAnimation, child: child);
      case DialogAnimationType.fade:
        return FadeTransition(opacity: curvedAnimation, child: child);
      case DialogAnimationType.slideBottom:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        );
      // ... (keep all other animation cases)
      default:
        return ScaleTransition(scale: curvedAnimation, child: child);
    }
  }

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  double _getDialogWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth;

    switch (widget.dialogWidth) {
      case DialogWidth.extraSmall:
        targetWidth = screenWidth * 0.4;
      case DialogWidth.small:
        targetWidth = screenWidth * 0.5;
      case DialogWidth.medium:
        targetWidth = screenWidth * 0.6;
      case DialogWidth.large:
        targetWidth = screenWidth * 0.75;
      case DialogWidth.extraLarge:
        targetWidth = screenWidth * 0.9;
      case DialogWidth.custom:
        targetWidth = widget.customWidth ?? (screenWidth * 0.6);
    }

    double maxWidth = screenWidth * (widget.maxWidthPercentage ?? 0.9);
    return targetWidth.clamp(widget.minWidth ?? (screenWidth * 0.3), maxWidth);
  }

  double? _getDialogHeight(BuildContext context) {
    if (widget.dialogHeight == DialogHeight.fitContent) {
      return null;
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double targetHeight;

    switch (widget.dialogHeight) {
      case DialogHeight.extraSmall:
        targetHeight = screenHeight * 0.25;
      case DialogHeight.small:
        targetHeight = screenHeight * 0.35;
      case DialogHeight.medium:
        targetHeight = screenHeight * 0.5;
      case DialogHeight.large:
        targetHeight = screenHeight * 0.65;
      case DialogHeight.extraLarge:
        targetHeight = screenHeight * 0.85;
      case DialogHeight.custom:
        targetHeight = widget.customHeight ?? (screenHeight * 0.5);
      case DialogHeight.fitContent:
        return null;
    }

    double maxHeight = screenHeight * (widget.maxHeightPercentage ?? 0.9);
    return targetHeight.clamp(widget.minHeight ?? (screenHeight * 0.2), maxHeight);
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
        minWidth: _getDialogWidth(context),
        maxWidth: _getDialogWidth(context),
        minHeight: _getDialogHeight(context) ?? 0,
        maxHeight: _getDialogHeight(context) ?? double.infinity,
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
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: widget.customContent ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.message,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
              ),
            ),
            const SizedBox(height: 15),

            // Buttons at the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    widget.cancelButtonText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (widget.onConfirm != null) {
                      Future.delayed(Duration.zero, widget.onConfirm!);
                    }
                  },
                  child: Text(
                    widget.confirmButtonText,
                    style: const TextStyle(
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

}