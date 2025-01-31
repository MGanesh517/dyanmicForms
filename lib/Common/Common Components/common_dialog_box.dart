
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