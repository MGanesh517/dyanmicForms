
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final commonStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
  final controller = Get.put(DynamicController());

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: GetBuilder<DynamicController>(
        initState: (_) => DynamicController.to.initGetDynamicListState(),
        builder: (value) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "List Screen",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Container(
                    width: 150,
                    color: Theme.of(context).colorScheme.secondary,
                    child: MaterialButton(
                      elevation: 2,
                      onPressed: () {
                        Get.toNamed('/dashboardView');
                      },
                      height: 50,
                      minWidth: 100,
                      color: Theme.of(context).colorScheme.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).colorScheme.secondary),
                            SizedBox(width: 8),
                            Text(
                              "Add Screen",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Obx(
                    () =>  controller.dynamicList.isNotEmpty
                        ? GridView.builder(
                            itemCount: controller.dynamicList.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: MediaQuery.of(context).size.width <= 800
                                  ? 1
                                  : MediaQuery.of(context).size.width <= 1300
                                      ? 2
                                      : MediaQuery.of(context).size.width <= 1700
                                          ? 3
                                          : 4,
                              childAspectRatio: 1,
                              crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
                              mainAxisExtent: 100,
                            ),
                            itemBuilder: (context, index) {
                              return CardWidget(
                                appLabel: controller.dynamicList[index].appLabel ?? 'N/A',
                                modelName: controller.dynamicList[index].modelName ?? 'N/A',
                                onTap: () {
                                  controller.getDynamicDetails(controller.dynamicList[index].id);
                                },
                              );
                            },
                          )
                        : const Center(child: Text("Data not found")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String appLabel;
  final String modelName;
  final VoidCallback? onTap;

  const CardWidget({
    super.key,
    required this.appLabel,
    required this.modelName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "AppLabel : ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Text(appLabel, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "ModelName : ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Text(modelName, overflow: TextOverflow.ellipsis)),
                      ],
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




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
// import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class ListScreen extends StatefulWidget {
//   const ListScreen({super.key});

//   @override
//   State<ListScreen> createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   final commonStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
//   final controller = Get.put(DynamicController());

//   final RefreshController refreshController = RefreshController(initialRefresh: false);

//   // @override
//   // void dispose() {
//   //   refreshController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//         return CommonScaffoldWithAppBar(
//           body: GetBuilder<DynamicController>(
//             initState: (_) => DynamicController.to.initGetDynamicListState(),
//             builder: (value) => Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                           "List Screen",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             color: Theme.of(context).colorScheme.primary,
//                           ),
//                         ),
//                       Container(
//                                 width: 150,
//                                 color: Theme.of(context).colorScheme.secondary,
//                                 child: MaterialButton(
//                                   elevation: 2,
//                                    onPressed: () {
//                                     Get.toNamed('/dashboardView');
//                                    },
//                                   height: 50,
//                                   minWidth: 100,
//                                   color: Theme.of(context).colorScheme.primary,
//                                   shape: const RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(6)),
//                                   ),
//                                   child: Center(
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).colorScheme.secondary),
//                                         SizedBox(width: 8),
//                                         Text(
//                                               "Add Screen",
//                                               style: TextStyle(
//                                                 color:
//                                                     Theme.of(context).colorScheme.secondary,
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                                           // ),
//                                                         ),
//                     ],
//                   ),
//                 const SizedBox(height: 16),
//                   Expanded(
//                     child: Container(
//                       width: Get.width,
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14.0),
//                       border: Border.all(width: 0.5, color: Colors.grey)),
//                       child: Obx(() => SmartRefresher(
//                             controller: refreshController,
//                             enablePullUp: true,
//                             onRefresh: () async {
//                               controller.isRefresh = true;
//                               controller.currentPage = 1;
//                               final result = await controller.getDynamicList();
//                               if (result) {
//                                 refreshController.resetNoData();
//                                 refreshController.refreshCompleted();
//                               } else {
//                                 refreshController.refreshFailed();
//                               }
//                             },
//                             onLoading: () async {
//                               if (controller.totalPages > 1) {
//                                 final result = await controller.getDynamicList();
//                                 if (result) {
//                                   if (controller.currentPage > controller.totalPages) {
//                                     refreshController.loadNoData();
//                                   } else {
//                                     refreshController.loadComplete();
//                                   }
//                                 } else {
//                                   refreshController.loadNoData();
//                                 }
//                               } else {
//                                 refreshController.loadNoData();
//                               }
//                             },
//                             child: controller.dynamicList.isNotEmpty
//                                 ? GridView.builder(
//                                     itemCount: controller.dynamicList.length,
//                                     shrinkWrap: true,
//                                     physics: const ClampingScrollPhysics(),
//                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: MediaQuery.of(context).size.width <= 800
//                                           ? 1
//                                           : MediaQuery.of(context).size.width <= 1300
//                                               ? 2
//                                               : MediaQuery.of(context).size.width <= 1700
//                                                   ? 3
//                                                   : 4,
//                                       childAspectRatio: 1,
//                                       crossAxisSpacing: MediaQuery.of(context).size.width <= 400 ? 10 : 30,
//                                       mainAxisExtent: 100,
//                                     ),
//                                     itemBuilder: (context, index) {
//                                       return CardWidget(
//                                         appLabel: controller.dynamicList[index].appLabel ?? 'N/A',
//                                         modelName: controller.dynamicList[index].modelName ?? 'N/A',
//                                            onTap:  () {
//                                             controller.getDynamicDetails(controller.dynamicList[index].id);
//                                            }
//                                       );
//                                     },
//                                   )
//                                 : const Center(child: Text("Data not found")),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//   }
// }

// class CardWidget extends StatelessWidget {
//   final String appLabel;
//   final String modelName;
//   final VoidCallback? onTap;

//   const CardWidget({
//     super.key,
//     required this.appLabel,
//     required this.modelName,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         color: Theme.of(context).colorScheme.secondary,
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Text(
//                           "AppLabel : ",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Expanded(child: Text(appLabel, overflow: TextOverflow.ellipsis)),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Text(
//                           "ModelName : ",
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Expanded(child: Text(modelName, overflow: TextOverflow.ellipsis)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }