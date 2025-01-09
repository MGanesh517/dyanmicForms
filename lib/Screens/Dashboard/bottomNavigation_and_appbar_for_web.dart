import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationItemCommon {
  final IconData icon;
  final String label;
  final Function() onTap;
  final MouseRegion? onHover;

  NavigationItemCommon({
    required this.icon,
    required this.label,
    required this.onTap,
    this.onHover,
  });
}

class NavigationItems {
  static final RxInt selectedIndex = 0.obs;
  // static final RxBool selectedValue = false.obs;
  // static final RxInt valueOFBottomIcon = 0.obs;

  static final List<NavigationItemCommon> items = [
    NavigationItemCommon(
      icon: Icons.dashboard,
      label: 'Dashboard',
      onTap: () => Get.toNamed('/homeScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.apps,
      label: 'Shimmer',
      onTap: () => Get.toNamed('/appScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.data_usage,
      label: 'Data',
      onTap: () => Get.toNamed('/dataScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.account_circle,
      label: 'Account',
      onTap: () => Get.toNamed('/accountScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Settings',
      onTap: () => Get.toNamed('/settingsScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Blinkit',
      onTap: () => Get.toNamed('/blinkitScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Zomato',
      onTap: () => Get.toNamed('/zomatoScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Swiggy',
      onTap: () => Get.toNamed('/swiggyScreen'),
    ),
    NavigationItemCommon(
      icon: Icons.settings,
      label: 'Instamart',
      onTap: () => Get.toNamed('/instamartScreen'),
    ),
  ];

  static List<NavigationItemCommon> get bottomNavItems {
    if (items.length <= 4) {
      return items;
    }
    return [
      ...items.take(3),
      NavigationItemCommon(
        icon: Icons.more_vert_outlined,
        label: 'More',
        onTap: () => Get.toNamed('/moreScreen'),
      ),
    ];
  }

  static List<NavigationItemCommon> get moreScreenItems {
    if (items.length <= 4) {
      return [];
    }
    return items.skip(3).toList();
  }

  static List<NavigationItemCommon> get webNavItems {
    if (items.length <= 6) {
      return items;
    }
    return [
      ...items.take(5),
      NavigationItemCommon(
        icon: Icons.more_vert_outlined,
        label: 'More',
        onTap: () {},
      ),
    ];
  }
}

Widget buildWebNavigation() {
  final visibleItems = NavigationItems.items.take(5).toList();
  final moreItems = NavigationItems.items.skip(5).toList();
  final hasMoreItems = NavigationItems.items.length > 5;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...visibleItems.map((item) {
        int index = NavigationItems.items.indexOf(item);
        return Obx(() => InkWell(
              onTap: () {
                NavigationItems.selectedIndex.value = index;
                item.onTap();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: NavigationItems.selectedIndex.value == index
                      ? Colors.transparent
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      item.label,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ));
      }).toList(),
      // if (hasMoreItems)
      //   CommonPopupMenu<int>(
      //     tooltip: 'More Options',
      //     items: moreItems.asMap().entries.map((entry) {
      //       final actualIndex = entry.key + 5; // Replace maxVisibleItems with 5
      //       return CustomPopupMenuItem<int>(
      //         value: actualIndex,
      //         label: entry.value.label,
      //         icon: entry.value.icon,
      //         isSelected: NavigationItems.selectedIndex.value == actualIndex,
      //       );
      //     }).toList(),
      //     onSelected: (index) {
      //       NavigationItems.selectedIndex.value = index;
      //       moreItems[index - 5].onTap(); // Replace maxVisibleItems with 5
      //     },
      //     backgroundColor: Colors.white,
      //     textColor: Colors.black,
      //   ),
    ],
  );
}

Widget buildMobileNavigation() {
  return Obx(() => BottomNavigationBar(
        currentIndex: NavigationItems.selectedIndex.value,
        onTap: (index) {
          NavigationItems.selectedIndex.value = index;
          NavigationItems.bottomNavItems[index].onTap();
        },
        type: BottomNavigationBarType.fixed,
        items: NavigationItems.bottomNavItems
            .map((item) => BottomNavigationBarItem(
                  tooltip: item.label,
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ));
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('More Options'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: NavigationItems.items.length,
          itemBuilder: (context, index) {
            final item = NavigationItems.items[index];
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.label),
              onTap: () {
                NavigationItems.items[index].onTap();
                // Get.back();
              },
            );
          },
        ),
      ),
    );
  }
}