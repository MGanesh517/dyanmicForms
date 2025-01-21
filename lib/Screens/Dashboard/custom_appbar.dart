
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Screens/Dashboard/drawer_code.dart';
import 'package:implementation_panel/Screens/Dashboard/drawer_controller.dart';
import 'package:implementation_panel/Screens/Login/logout.dart';


//////************************************** CommonComponent for the EveryPage **************************************//////

class CommonScaffoldWithAppBar extends StatelessWidget {
  final Widget body;
  final Color? appBarBGColor, iconColor;
  final VoidCallback? leadingLink;
  final Widget? leadingChild;
  final String? titleChild;
  final List<Widget>? actionsWidget;
  final bool? centerTitle;

  CommonScaffoldWithAppBar({
    super.key,
    required this.body,
    this.appBarBGColor,
    this.leadingLink,
    this.iconColor,
    this.leadingChild,
    this.titleChild,
    this.actionsWidget,
    this.centerTitle,
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth >= 700;

        if (MediaQuery.of(context).size.width < 700 &&
            !Get.find<DrawerControllerX>().isTextNotVisible) {
          Get.find<DrawerControllerX>().toggleShowText();
        }

        Widget drawer = AdaptiveDrawer(
          title: '',
          currentScreen: body,
          onScreenSelected: (screen) {
            if (!isLargeScreen) {
              Navigator.of(context).pop();
            }
          },
        );

        return Scaffold(
          backgroundColor: Colors.grey[50],
          key: scaffoldKey,
          appBar: AppBar(
            toolbarHeight: 64,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: leadingChild != null
                ? Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: leadingLink,
                      child: leadingChild,
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.menu, color: iconColor ?? Colors.white),
                    onPressed: () {
                      if (!isLargeScreen) {
                        scaffoldKey.currentState?.openDrawer();
                      } else {
                        Get.find<DrawerControllerX>().toggleShowText();
                      }
                    },
                  ),
            // title: isLargeScreen ? buildWebNavigation() : null,
            actions: [
              IconButton(onPressed: () {
                    Get.dialog(LogoutDialog(dialogWidth: MediaQuery.of(context).size.width <= 600
                  ? DialogWidthF.large: DialogWidthF.extraSmall ,
                  dialogHeight: DialogHeightF.fitContent,),  barrierDismissible: false);
                  }, icon: Icon(Icons.logout)),
              SizedBox(width: isLargeScreen ? 30 : 10),
            ],
            centerTitle: centerTitle,
          ),
          drawer: !isLargeScreen ? drawer : null,
          body: SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLargeScreen)
                  Obx(() => SizedBox(
                        width: Get.find<DrawerControllerX>().isTextNotVisible
                            ? 250
                            : 070,
                        child: drawer,
                      )),
                      VerticalDivider(thickness: 0.5,width: 0.5,),
                Expanded(child: SingleChildScrollView(child: body)),
              ],
            ),
          ),
          // bottomNavigationBar: !isLargeScreen ? buildMobileNavigation() : null,
        );
      },
    );
  }
}

class AdaptiveDrawer extends StatefulWidget {
  final String title;
  final Widget currentScreen;
  final Function(Widget) onScreenSelected;

  const AdaptiveDrawer({
    super.key,
    required this.title,
    required this.currentScreen,
    required this.onScreenSelected,
  });

  @override
  _AdaptiveDrawerState createState() => _AdaptiveDrawerState();
}

class _AdaptiveDrawerState extends State<AdaptiveDrawer> {
  final drawerController = Get.find<DrawerControllerX>();

  // void onItemTapped(int index, String route) {
  //   setState(() {
  //     drawerController.selectedIndex = index;
  //   });
  //   Get.offAllNamed(route);
  // }

void onItemTapped(int index, String route) {
  drawerController.selectedIndex = index;  // Using controller directly
  Get.toNamed(route);
}

//////************************************** Drawer & it's SubItems **************************************//////


  @override
  Widget build(BuildContext context) {
    final drawerController = Get.find<DrawerControllerX>();

    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          MediaQuery.of(context).size.width <= 700
              ? Container(height: 70)
              : Container(height: 0),
          // Obx(() => CommonCardForDrawer(
          //       title: drawerController.isTextNotVisible
          //           ? const Text('B2B Dashboard')
          //           : const SizedBox.shrink(),
          //       icon: Icon(Icons.radio_button_checked_rounded),
          //       // endIcon: Icons.chevron_right,
          //       subItems: [
          //         DrawerSubItem(
          //           title: 'Tabs Example',
          //           icon: Icons.tab,
          //           onTap: () => print('Tabs Example'),
          //         ),
          //         DrawerSubItem(
          //           title: 'Scrollable Tabs',
          //           icon: Icons.view_carousel,
          //           onTap: () => print('Scrollable Tabs'),
          //         ),
          //       ],
          //       isSelected: drawerController.selectedIndex == 0,
          //       onTapNavigation: () => onItemTapped(0, '/homeScreen'),
          //     )),
          Obx(() => CommonCardForDrawer(
                title: drawerController.isTextNotVisible
                    ? const Text('Create Screen')
                    : const SizedBox.shrink(),
                icon: const Icon(Icons.add_circle_outline_outlined),
                isSelected: drawerController.selectedIndex == 0,
                onTapNavigation: () => onItemTapped(0, '/dashboardView'),
              )),

          Obx(() => CommonCardForDrawer(
                title: drawerController.isTextNotVisible
                    ? const Text('List Screen')
                    : const SizedBox.shrink(),
                icon: const Icon(Icons.live_tv_sharp),
                isSelected: drawerController.selectedIndex == 1,
                onTapNavigation: () => onItemTapped(1, '/listScreen'),
              )),
          
        ],
      ),
    );
  }
}




// class DrawerSubItem {
//   final String title;
//   final IconData icon;
//   final VoidCallback? onTap;
//   final bool isSelected;

//   DrawerSubItem({
//     required this.title,
//     required this.icon,
//     this.onTap,
//     this.isSelected = false,
//   });

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
//           const SizedBox(width: 10),
//           Text(title,
//               style: TextStyle(color: isSelected ? Colors.blue : Colors.grey)),
//         ],
//       ),
//     );
//   }
// }


// class CommonCardForDrawer extends StatefulWidget {
//   final VoidCallback onTapNavigation;
//   final Widget title;
//   final Icon? icon;
//   final bool isSelected;
//   final List<DrawerSubItem>? subItems;

//   const CommonCardForDrawer({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onTapNavigation,
//     required this.isSelected,
//     this.subItems,
//   });

//   @override
//   State<CommonCardForDrawer> createState() => _CommonCardForDrawerState();
// }

// class _CommonCardForDrawerState extends State<CommonCardForDrawer> {
//   bool isExpanded = false;
//   bool isSubItemSelected = false;

//   String? getTooltipText() {
//     if (widget.title is Text) {
//       return (widget.title as Text).data;
//     } else if (widget.title is SizedBox) {
//       return null;
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final drawerController = Get.find<DrawerControllerX>();
//     final drawerController = Get.put(DrawerControllerX());
//     final hasSubItems = widget.subItems != null && widget.subItems!.isNotEmpty;
//     final tooltipText = getTooltipText();

//     return Column(
//       children: [
//         Padding(
//             padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
//             child: Material(
//                 color: (widget.isSelected || isSubItemSelected)
//                     ? Colors.blue[50]
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(8),
//                 child:
//                     // Obx(() =>
//                     MouseRegion(
//                   // onHover: (PointerHoverEvent event) {
//                   //   setState(() => drawerController.isHovered = true);
//                   //   if (!drawerController.isTextNotVisible &&
//                   //       hasSubItems &&
//                   //       drawerController.isHovered) {
//                   //     showPopupMenu();
//                   //   }
//                   // },
//                   // onEnter: (PointerEnterEvent event) {
//                   //   setState(() => drawerController.isHovered = true);
//                   //   // Show popup menu immediately when drawer is minimized and has subitems
//                   //   if (!drawerController.isTextNotVisible &&
//                   //       hasSubItems &&
//                   //       drawerController.isHovered) {
//                   //     showPopupMenu();
//                   //   }
//                   // },
//                   // onExit: (event) {
//                   //   setState(() => drawerController.isHovered = false);
//                   // },

//                   onEnter: (PointerEnterEvent event) {
//                     // Close existing popup if any
//                     if (drawerController.isPopupMenuVisible.value) {
//                       Navigator.of(context).pop();
//                     }

//                     setState(() => drawerController.isHovered = true);
//                     if (!drawerController.isTextNotVisible &&
//                         hasSubItems &&
//                         drawerController.isHovered) {
//                       showPopupMenu();
//                     }
//                   },
//                   onHover: (PointerHoverEvent event) {
//                     drawerController.isHovered = true;
//                     if (!drawerController.isTextNotVisible && hasSubItems) {
//                       showPopupMenu();
//                     }
//                   },
//                   // cursor: MouseCursor.defer,
//                   onExit: (PointerExitEvent event) {
//                     setState(() => drawerController.isHovered = false);
//                     // Future.delayed(Duration(milliseconds: 500), () {
//                       if (!drawerController.isHovered) {
//                         if (drawerController.isPopupMenuVisible.value) {
//                           // Navigator.of(context).pop();
//                         }
//                       }
//                     // });
//                   },

//                   // onEnter: (PointerEnterEvent event) {
//                   //   // Close any existing popups
//                   //   // Navigator.of(context).pop();

//                   //   setState(() => drawerController.isHovered = true);
//                   //   if (!drawerController.isTextNotVisible &&
//                   //       hasSubItems &&
//                   //       drawerController.isHovered) {
//                   //     showPopupMenu();
//                   //   }
//                   // },
//                   // onExit: (event) {
//                   //   setState(() => drawerController.isHovered = false);
//                   //   // Optionally, you can add a slight delay before closing the popup
//                   //   // to prevent accidental closing when moving between items
//                   //   Future.delayed(Duration(milliseconds: 100), () {
//                   //     if (!drawerController.isHovered) {
//                   //       Navigator.of(context).pop();
//                   //     }
//                   //   });
//                   // },
//                   child: !hasSubItems && tooltipText != null
//                       ? Tooltip(
//                           message: tooltipText,
//                           preferBelow: false,
//                           verticalOffset: 20,
//                           child: buildDrawerItem(hasSubItems, drawerController),
//                         )
//                       : buildDrawerItem(hasSubItems, drawerController),
//                 ))),
//         // ),
//         if (isExpanded && hasSubItems && drawerController.isTextNotVisible)
//           Padding(
//             padding: const EdgeInsets.only(left: 24),
//             child: buildSubItems(),
//           ),
//       ],
//     );
//   }

//   Widget buildDrawerItem(bool hasSubItems, DrawerControllerX drawerController) {
//     return InkWell(
//       onTap: hasSubItems && drawerController.isTextNotVisible
//           ? () {
//               setState(() {
//                 isExpanded = !isExpanded;
//               });
//             }
//           : widget.onTapNavigation,
//       borderRadius: BorderRadius.circular(8),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           mainAxisAlignment: drawerController.isTextNotVisible
//               ? MainAxisAlignment.start
//               : MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               widget.icon?.icon,
//               color: getIconColor(),
//             ),
//             if (drawerController.isTextNotVisible) ...[
//               const SizedBox(width: 4),
//               Expanded(
//                 child: DefaultTextStyle(
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15,
//                     color: getIconColor(),
//                   ),
//                   child: widget.title,
//                 ),
//               ),
//               if (hasSubItems)
//                 Icon(
//                   isExpanded
//                       ? Icons.keyboard_arrow_up
//                       : Icons.keyboard_arrow_down,
//                   color: getIconColor(),
//                 ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildSubItems() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: widget.subItems!.map((subItem) {
//         return MouseRegion(
//           cursor: MouseCursor.defer,
//           // onHover: (event) {
//           //   if (EditableText.debugDeterministicCursor) {
//           //     setState(() {
//           //       isSubItemSelected = true;
//           //     });
//           //   }
//           // },
//           onHover: (event) => setState(() {
//             isSubItemSelected = true;
//           }),
//           onEnter: (_) => setState(() {
//             isSubItemSelected = true;
//           }),
//           onExit: (_) => setState(() {
//             isSubItemSelected = false;
//           }),
//           child: InkWell(
//             onTap: () {
//               setState(() {
//                 isSubItemSelected = true;
//               });
//               if (subItem.onTap != null) {
//                 subItem.onTap!();
//               }
//             },
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//               child: Row(
//                 children: [
//                   Icon(
//                     subItem.icon,
//                     color: subItem.isSelected
//                         ? const Color(0xff1562ab)
//                         : Colors.grey[600],
//                     size: 20,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     subItem.title,
//                     style: TextStyle(
//                       color: subItem.isSelected
//                           ? const Color(0xff1562ab)
//                           : Colors.grey[600],
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Color getIconColor() {
//     if (widget.isSelected || isSubItemSelected) {
//       return const Color(0xff1562ab);
//     }
//     return Colors.grey[600]!;
//   }

//   void showPopupMenu() {
//     final drawerController = Get.find<DrawerControllerX>();

//     // Only show if not already visible
//     if (!drawerController.isPopupMenuVisible.value) {
//       drawerController.isPopupMenuVisible.value = true;

//       final RenderBox button = context.findRenderObject() as RenderBox;
//       final RenderBox overlay = Navigator.of(context)
//           .overlay!
//           .context
//           .findRenderObject() as RenderBox;

//       final RelativeRect position = RelativeRect.fromRect(
//         Rect.fromPoints(
//           button.localToGlobal(Offset(button.size.width - 4, 0),
//               ancestor: overlay),
//           button.localToGlobal(button.size.bottomRight(Offset.zero),
//               ancestor: overlay),
//         ),
//         Offset.zero & overlay.size,
//       );

//       showMenu(
//         context: context,
//         position: position,
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//         color: Colors.white,
//         constraints: const BoxConstraints(minWidth: 200),
//         items: widget.subItems!.map((subItem) {
//           return PopupMenuItem<void>(
//             onTap: () {
//               drawerController.isPopupMenuVisible.value = false;
//               subItem.onTap?.call();
//             },
//             child: Row(
//               children: [
//                 Icon(
//                   subItem.icon,
//                   size: 20,
//                   color: subItem.isSelected
//                       ? const Color(0xff1562ab)
//                       : Colors.grey[600],
//                 ),
//                 const SizedBox(width: 12),
//                 Text(
//                   subItem.title,
//                   style: TextStyle(
//                     color: subItem.isSelected
//                         ? const Color(0xff1562ab)
//                         : Colors.grey[600],
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ).then((_) {
//         print("printing the drawer ${drawerController.isDrawerOpen}");
//         // Ensure popup state is reset when menu is closed
//         drawerController.isPopupMenuVisible.value = false;
//       });
//     }
//   }
// }

//////************************************** BottomNavigation and appbar for web its common Component list **************************************//////


// class NavigationItemCommon {
//   final IconData icon;
//   final String label;
//   final Function() onTap;
//   final MouseRegion? onHover;

//   NavigationItemCommon({
//     required this.icon,
//     required this.label,
//     required this.onTap,
//     this.onHover,
//   });
// }

// class NavigationItems {
//   static final RxInt selectedIndex = 0.obs;
//   // static final RxBool selectedValue = false.obs;
//   // static final RxInt valueOFBottomIcon = 0.obs;

//   static final List<NavigationItemCommon> items = [
//     NavigationItemCommon(
//       icon: Icons.dashboard,
//       label: 'Dashboard',
//       onTap: () => Get.toNamed('/homeScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.apps,
//       label: 'Shimmer',
//       onTap: () => Get.toNamed('/appScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.data_usage,
//       label: 'Data',
//       onTap: () => Get.toNamed('/dataScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.account_circle,
//       label: 'Account',
//       onTap: () => Get.toNamed('/accountScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.settings,
//       label: 'Settings',
//       onTap: () => Get.toNamed('/settingsScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.settings,
//       label: 'Blinkit',
//       onTap: () => Get.toNamed('/blinkitScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.settings,
//       label: 'Zomato',
//       onTap: () => Get.toNamed('/zomatoScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.settings,
//       label: 'Swiggy',
//       onTap: () => Get.toNamed('/swiggyScreen'),
//     ),
//     NavigationItemCommon(
//       icon: Icons.settings,
//       label: 'Instamart',
//       onTap: () => Get.toNamed('/instamartScreen'),
//     ),
//   ];

//   // static List<NavigationItemCommon> get bottomNavItems {
//   //   if (items.length <= 4) {
//   //     return items;
//   //   }
//   //   return [
//   //     ...items.take(3),
//   //     NavigationItemCommon(
//   //       icon: Icons.more_vert_outlined,
//   //       label: 'More',
//   //       onTap: () => Get.toNamed('/moreScreen'),
//   //     ),
//   //   ];
//   // }

//   // static List<NavigationItemCommon> get moreScreenItems {
//   //   if (items.length <= 4) {
//   //     return [];
//   //   }
//   //   return items.skip(3).toList();
//   // }

//   // static List<NavigationItemCommon> get webNavItems {
//   //   if (items.length <= 6) {
//   //     return items;
//   //   }
//   //   return [
//   //     ...items.take(5),
//   //     NavigationItemCommon(
//   //       icon: Icons.more_vert_outlined,
//   //       label: 'More',
//   //       onTap: () {},
//   //     ),
//   //   ];
//   // }
// }

// Widget buildWebNavigation() {
//   final visibleItems = NavigationItems.items.take(5).toList();
//   final moreItems = NavigationItems.items.skip(5).toList();
//   final hasMoreItems = NavigationItems.items.length > 5;
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       ...visibleItems.map((item) {
//         int index = NavigationItems.items.indexOf(item);
//         return Obx(() => InkWell(
//               onTap: () {
//                 NavigationItems.selectedIndex.value = index;
//                 item.onTap();
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: NavigationItems.selectedIndex.value == index
//                       ? Colors.transparent
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       item.label,
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                     SizedBox(width: 16),
//                   ],
//                 ),
//               ),
//             ));
//       }).toList(),
//       // if (hasMoreItems)
//       //   CommonPopupMenu<int>(
//       //     tooltip: 'More Options',
//       //     items: moreItems.asMap().entries.map((entry) {
//       //       final actualIndex = entry.key + 5; // Replace maxVisibleItems with 5
//       //       return CustomPopupMenuItem<int>(
//       //         value: actualIndex,
//       //         label: entry.value.label,
//       //         icon: entry.value.icon,
//       //         isSelected: NavigationItems.selectedIndex.value == actualIndex,
//       //       );
//       //     }).toList(),
//       //     onSelected: (index) {
//       //       NavigationItems.selectedIndex.value = index;
//       //       moreItems[index - 5].onTap(); // Replace maxVisibleItems with 5
//       //     },
//       //     backgroundColor: Colors.white,
//       //     textColor: Colors.black,
//       //   ),
//     ],
//   );
// }

// Widget buildMobileNavigation() {
//   return Obx(() => BottomNavigationBar(
//         currentIndex: NavigationItems.selectedIndex.value,
//         onTap: (index) {
//           NavigationItems.selectedIndex.value = index;
//           NavigationItems.bottomNavItems[index].onTap();
//         },
//         type: BottomNavigationBarType.fixed,
//         items: NavigationItems.bottomNavItems
//             .map((item) => BottomNavigationBarItem(
//                   tooltip: item.label,
//                   icon: Icon(item.icon),
//                   label: item.label,
//                 ))
//             .toList(),
//       ));
// }

// class MoreScreen extends StatelessWidget {
//   const MoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('More Options'),
//       ),
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: NavigationItems.items.length,
//           itemBuilder: (context, index) {
//             final item = NavigationItems.items[index];
//             return ListTile(
//               leading: Icon(item.icon),
//               title: Text(item.label),
//               onTap: () {
//                 NavigationItems.items[index].onTap();
//                 // Get.back();
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
