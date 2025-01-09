import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Screens/Dashboard/drawer_controller.dart';


class DrawerSubItem {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isSelected;

  DrawerSubItem({
    required this.title,
    required this.icon,
    this.onTap,
    this.isSelected = false,
  });

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
          const SizedBox(width: 10),
          Text(title,
              style: TextStyle(color: isSelected ? Colors.blue : Colors.grey)),
        ],
      ),
    );
  }
}

class CommonCardForDrawer extends StatefulWidget {
  final VoidCallback onTapNavigation;
  final Widget title;
  final Icon? icon;
  final bool isSelected;
  final List<DrawerSubItem>? subItems;

  const CommonCardForDrawer({
    super.key,
    required this.title,
    required this.icon,
    required this.onTapNavigation,
    required this.isSelected,
    this.subItems,
  });

  @override
  State<CommonCardForDrawer> createState() => _CommonCardForDrawerState();
}

class _CommonCardForDrawerState extends State<CommonCardForDrawer> {
  bool isExpanded = false;
  bool isSubItemSelected = false;

  String? getTooltipText() {
    if (widget.title is Text) {
      return (widget.title as Text).data;
    } else if (widget.title is SizedBox) {
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // final drawerController = Get.find<DrawerControllerX>();
    final drawerController = Get.put(DrawerControllerX());
    final hasSubItems = widget.subItems != null && widget.subItems!.isNotEmpty;
    final tooltipText = getTooltipText();

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Material(
                color: (widget.isSelected || isSubItemSelected)
                    ? Colors.blue[50]
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child:
                    // Obx(() =>
                    MouseRegion(
                  // onHover: (PointerHoverEvent event) {
                  //   setState(() => drawerController.isHovered = true);
                  //   if (!drawerController.isTextNotVisible &&
                  //       hasSubItems &&
                  //       drawerController.isHovered) {
                  //     showPopupMenu();
                  //   }
                  // },
                  // onEnter: (PointerEnterEvent event) {
                  //   setState(() => drawerController.isHovered = true);
                  //   // Show popup menu immediately when drawer is minimized and has subitems
                  //   if (!drawerController.isTextNotVisible &&
                  //       hasSubItems &&
                  //       drawerController.isHovered) {
                  //     showPopupMenu();
                  //   }
                  // },
                  // onExit: (event) {
                  //   setState(() => drawerController.isHovered = false);
                  // },

                  onEnter: (PointerEnterEvent event) {
                    // Close existing popup if any
                    if (drawerController.isPopupMenuVisible.value) {
                      Navigator.of(context).pop();
                    }

                    setState(() => drawerController.isHovered = true);
                    if (!drawerController.isTextNotVisible &&
                        hasSubItems &&
                        drawerController.isHovered) {
                      showPopupMenu();
                    }
                  },
                  onHover: (PointerHoverEvent event) {
                    drawerController.isHovered = true;
                    if (!drawerController.isTextNotVisible && hasSubItems) {
                      showPopupMenu();
                    }
                  },
                  // cursor: MouseCursor.defer,
                  onExit: (PointerExitEvent event) {
                    setState(() => drawerController.isHovered = false);
                    // Future.delayed(Duration(milliseconds: 500), () {
                      if (!drawerController.isHovered) {
                        if (drawerController.isPopupMenuVisible.value) {
                          // Navigator.of(context).pop();
                        }
                      }
                    // });
                  },

                  // onEnter: (PointerEnterEvent event) {
                  //   // Close any existing popups
                  //   // Navigator.of(context).pop();

                  //   setState(() => drawerController.isHovered = true);
                  //   if (!drawerController.isTextNotVisible &&
                  //       hasSubItems &&
                  //       drawerController.isHovered) {
                  //     showPopupMenu();
                  //   }
                  // },
                  // onExit: (event) {
                  //   setState(() => drawerController.isHovered = false);
                  //   // Optionally, you can add a slight delay before closing the popup
                  //   // to prevent accidental closing when moving between items
                  //   Future.delayed(Duration(milliseconds: 100), () {
                  //     if (!drawerController.isHovered) {
                  //       Navigator.of(context).pop();
                  //     }
                  //   });
                  // },
                  child: !hasSubItems && tooltipText != null
                      ? Tooltip(
                          message: tooltipText,
                          preferBelow: false,
                          verticalOffset: 20,
                          child: buildDrawerItem(hasSubItems, drawerController),
                        )
                      : buildDrawerItem(hasSubItems, drawerController),
                ))),
        // ),
        if (isExpanded && hasSubItems && drawerController.isTextNotVisible)
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: buildSubItems(),
          ),
      ],
    );
  }

  Widget buildDrawerItem(bool hasSubItems, DrawerControllerX drawerController) {
    return InkWell(
      onTap: hasSubItems && drawerController.isTextNotVisible
          ? () {
              setState(() {
                isExpanded = !isExpanded;
              });
            }
          : widget.onTapNavigation,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: drawerController.isTextNotVisible
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon?.icon,
              color: getIconColor(),
            ),
            if (drawerController.isTextNotVisible) ...[
              const SizedBox(width: 4),
              Expanded(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: getIconColor(),
                  ),
                  child: widget.title,
                ),
              ),
              if (hasSubItems)
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: getIconColor(),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildSubItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.subItems!.map((subItem) {
        return MouseRegion(
          cursor: MouseCursor.defer,
          // onHover: (event) {
          //   if (EditableText.debugDeterministicCursor) {
          //     setState(() {
          //       isSubItemSelected = true;
          //     });
          //   }
          // },
          onHover: (event) => setState(() {
            isSubItemSelected = true;
          }),
          onEnter: (_) => setState(() {
            isSubItemSelected = true;
          }),
          onExit: (_) => setState(() {
            isSubItemSelected = false;
          }),
          child: InkWell(
            onTap: () {
              setState(() {
                isSubItemSelected = true;
              });
              if (subItem.onTap != null) {
                subItem.onTap!();
              }
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    subItem.icon,
                    color: subItem.isSelected
                        ? const Color(0xff1562ab)
                        : Colors.grey[600],
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    subItem.title,
                    style: TextStyle(
                      color: subItem.isSelected
                          ? const Color(0xff1562ab)
                          : Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color getIconColor() {
    if (widget.isSelected || isSubItemSelected) {
      return const Color(0xff1562ab);
    }
    return Colors.grey[600]!;
  }

  void showPopupMenu() {
    final drawerController = Get.find<DrawerControllerX>();

    // Only show if not already visible
    if (!drawerController.isPopupMenuVisible.value) {
      drawerController.isPopupMenuVisible.value = true;

      final RenderBox button = context.findRenderObject() as RenderBox;
      final RenderBox overlay = Navigator.of(context)
          .overlay!
          .context
          .findRenderObject() as RenderBox;

      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(Offset(button.size.width - 4, 0),
              ancestor: overlay),
          button.localToGlobal(button.size.bottomRight(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      );

      showMenu(
        context: context,
        position: position,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        constraints: const BoxConstraints(minWidth: 200),
        items: widget.subItems!.map((subItem) {
          return PopupMenuItem<void>(
            onTap: () {
              drawerController.isPopupMenuVisible.value = false;
              subItem.onTap?.call();
            },
            child: Row(
              children: [
                Icon(
                  subItem.icon,
                  size: 20,
                  color: subItem.isSelected
                      ? const Color(0xff1562ab)
                      : Colors.grey[600],
                ),
                const SizedBox(width: 12),
                Text(
                  subItem.title,
                  style: TextStyle(
                    color: subItem.isSelected
                        ? const Color(0xff1562ab)
                        : Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ).then((_) {
        print("printing the drawer ${drawerController.isDrawerOpen}");
        // Ensure popup state is reset when menu is closed
        drawerController.isPopupMenuVisible.value = false;
      });
    }
  }
}