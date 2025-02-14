
// import 'package:flutter/material.dart';

// class MultiLevelDropdown extends StatefulWidget {
//   final Function(String) onSelected;
//   // final List<DropdownMenuItem<String>> itemBuilder;

  

//   const MultiLevelDropdown({super.key, required this.onSelected});

//   @override
//   _MultiLevelDropdownState createState() => _MultiLevelDropdownState();
// }

// class _MultiLevelDropdownState extends State<MultiLevelDropdown> {
//   String? selectedValue;

//   final Map<String, Map<String, List<String>>> dropdownData = {
//     "California": {
//       "Los Angeles": ["Beverly Hills", "Hollywood", "Santa Monica"],
//       "San Francisco": ["Mission District", "Fisherman's Wharf", "Chinatown"]
//     },
//     "Texas": {
//       "Houston": ["Downtown", "Midtown", "Uptown"],
//       "Dallas": ["Deep Ellum", "Bishop Arts District", "Oak Lawn"]
//     }
//   };

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
//       color: Theme.of(context).colorScheme.secondary,
//       offset: Offset(0, 48),
//       onSelected: (value) {
//         setState(() {
//           selectedValue = value;
//         });
//         widget.onSelected(value);
//       },
//       itemBuilder: (context) => dropdownData.entries.map((province) {
//         return PopupMenuItem<String>(
//           child: SizedBox(
//             child: SubMenu(
//               title: province.key,
//               subItems: province.value,
//               onSelected: widget.onSelected,
//             ),
//           ),
//         );
//       }).toList(),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               child: Text(selectedValue ?? "Please select",
//                   overflow: TextOverflow.ellipsis),
//             ),
//             const Icon(Icons.arrow_drop_down),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SubMenu extends StatelessWidget {
//   final String title;
//   final Map<String, List<String>> subItems;
//   final ValueChanged<String> onSelected;

//   const SubMenu({
//     super.key,
//     required this.title,
//     required this.subItems,
//     required this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
//       offset: Offset(100, 0),
//       color: Theme.of(context).colorScheme.secondary,
//       onSelected: onSelected,
//       itemBuilder: (context) => subItems.entries.expand((city) {
//         return [
//           PopupMenuItem<String>(
//             child: SizedBox(
//               width: 100,
//               child: PopupMenuButton<String>(
//                 constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
//                 color: Theme.of(context).colorScheme.secondary,
//                 offset: Offset(100, 0),
//                 onSelected: (area) {
//                   // onSelected("$title/${city.key}/$area");
//                   onSelected("$area");
//                 },
//                 itemBuilder: (context) => city.value
//                     .map((area) => PopupMenuItem<String>(
//                           value: "$title/${city.key}/$area",
//                           child: SizedBox(
//                             width: 100,
//                             child: Text(area, overflow: TextOverflow.ellipsis),
//                           ),
//                         ))
//                     .toList(),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                         child: Text(city.key, overflow: TextOverflow.ellipsis)),
//                     const Icon(Icons.arrow_right),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ];
//       }).toList(),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
//           const Icon(Icons.arrow_right),
//         ],
//       ),
//     );
//   }
// }













import 'package:flutter/material.dart';

class MultiLevelDropdown extends StatefulWidget {
  final Map<String, Map<String, List<String>>> dropdownData;
  final Function(String) onSelected;
  final String hintText;

  const MultiLevelDropdown({
    super.key,
    required this.dropdownData,
    required this.onSelected,
    this.hintText = "Please select",
  });

  @override
  _MultiLevelDropdownState createState() => _MultiLevelDropdownState();
}

class _MultiLevelDropdownState extends State<MultiLevelDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      constraints: const BoxConstraints(minWidth: 110, maxWidth: 110),
      color: Theme.of(context).colorScheme.surface,
      offset: const Offset(0, 48),
      onSelected: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onSelected(value);
      },
      itemBuilder: (context) => widget.dropdownData.entries.map((province) {
        return PopupMenuItem<String>(
          child: SizedBox(
            child: SubMenu(
              title: province.key,
              subItems: province.value,
              onSelected: widget.onSelected,
            ),
          ),
        );
      }).toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(selectedValue ?? widget.hintText,
                  overflow: TextOverflow.ellipsis),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

class SubMenu extends StatelessWidget {
  final String title;
  final Map<String, List<String>> subItems;
  final ValueChanged<String> onSelected;

  const SubMenu({
    super.key,
    required this.title,
    required this.subItems,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      constraints: const BoxConstraints(minWidth: 110, maxWidth: 110),
      offset: const Offset(100, 0),
      color: Theme.of(context).colorScheme.surface,
      onSelected: onSelected,
      itemBuilder: (context) => subItems.entries.expand((city) {
        return [
          PopupMenuItem<String>(
            child: SizedBox(
              width: 140,
              child: PopupMenuButton<String>(
                constraints: const BoxConstraints(minWidth: 110, maxWidth: 110),
                color: Theme.of(context).colorScheme.surface,
                offset: const Offset(100, 0),
                // onSelected: (area) {
                //   onSelected(area);
                // },
                // itemBuilder: (context) => city.value
                //     .map((area) => PopupMenuItem<String>(
                //           value: area,
                //           child: Text(area, overflow: TextOverflow.ellipsis),
                //         ))
                //     .toList(),
                onSelected: (area) {
                  // onSelected("$title/${city.key}/$area");
                  onSelected("$area");
                },
                itemBuilder: (context) => city.value
                    .map((area) => PopupMenuItem<String>(
                          value: "$title/${city.key}/$area",
                          child: SizedBox(
                            width: 100,
                            child: Text(area, overflow: TextOverflow.ellipsis),
                          ),
                        ))
                    .toList(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(city.key, overflow: TextOverflow.ellipsis)),
                    const Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
          ),
        ];
      }).toList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
          const Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
