// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackingListContainer extends StatefulWidget {
  const PackingListContainer({super.key});

  @override
  State<PackingListContainer> createState() => _PackingListContainerState();
}

class _PackingListContainerState extends State<PackingListContainer> {
  bool _isEssentialsExpanded = false;
  bool _isClothingExpanded = false;
  bool _isBeachGearExpanded = false;

  void _onItemTapped(String item) {
    print("Tapped on: $item");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCategorySection(
            title: "Essentials",
            isExpanded: _isEssentialsExpanded,
            onTap: () =>
                setState(() => _isEssentialsExpanded = !_isEssentialsExpanded),
            items: [
              {
                "title": "Passport",
                "assignedTo": "Sophia Williams",
                "icon": Icons.check_circle,
                "iconColor": Colors.green
              },
              {
                "title": "Travel Insurance",
                "assignedTo": "Emma Johnson",
                "icon": Icons.menu,
                "iconColor": Colors.grey
              },
              {
                "title": "Credit Cards",
                "assignedTo": "Sophia Williams",
                "icon": Icons.check_circle,
                "iconColor": Colors.green
              },
            ],
          ),
          SizedBox(height: 12.h),
          _buildCategorySection(
            title: "Clothing",
            isExpanded: _isClothingExpanded,
            onTap: () =>
                setState(() => _isClothingExpanded = !_isClothingExpanded),
            items: [
              {
                "title": "Swimsuits",
                "assignedTo": "Olivia Davis",
                "icon": Icons.check_circle,
                "iconColor": Colors.green
              },
              {
                "title": "Sundresses",
                "assignedTo": "Emma Johnson",
                "icon": Icons.check_circle,
                "iconColor": Colors.green
              },
              {
                "title": "Sandals",
                "assignedTo": "Emma Johnson",
                "icon": Icons.check_circle,
                "iconColor": Colors.green
              },
              {
                "title": "Sandals Wilson",
                "assignedTo": "Ava Wilson",
                "icon": Icons.menu,
                "iconColor": Colors.grey
              },
            ],
          ),
          SizedBox(height: 12.h),
          _buildCategorySection(
            title: "Beach Gear",
            isExpanded: _isBeachGearExpanded,
            onTap: () =>
                setState(() => _isBeachGearExpanded = !_isBeachGearExpanded),
            items: [
              {
                "title": "Sunscreen",
                "assignedTo": "Sophia Williams",
                "icon": Icons.menu,
                "iconColor": Colors.grey
              },
              {
                "title": "Beach Towels",
                "assignedTo": "Olivia Davis",
                "icon": Icons.menu,
                "iconColor": Colors.grey
              },
              {
                "title": "Beach Umbrella",
                "assignedTo": "Ava Wilson",
                "icon": Icons.menu,
                "iconColor": Colors.grey
              },
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Map<String, dynamic>> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right,
              size: 24.sp,
            ),
            onTap: onTap,
          ),
          if (isExpanded)
            ...items.map((item) => PackingItem(
                  icon: item["icon"],
                  iconColor: item["iconColor"],
                  title: item["title"],
                  assignedTo: item["assignedTo"],
                  onTap: () => _onItemTapped(item["title"]),
                )),
        ],
      ),
    );
  }
}

class PackingItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String assignedTo;
  final VoidCallback onTap;

  const PackingItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.assignedTo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isChecked = icon == Icons.check_circle;
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 20.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: assignedTo.isNotEmpty
          ? Row(
              children: [
                Text(
                  "Assigned to: ",
                  style: TextStyle(
                      fontSize: 12.sp, color: Colors.black), // Darker pink
                ),
                Text(
                  assignedTo,
                  style: TextStyle(
                      fontSize: 12.sp, color: Colors.pinkAccent), // Darker pink
                ),
              ],
            )
          : null,
      trailing: Icon(Icons.more_horiz, size: 20.sp),
      onTap: onTap,
    );
  }
}
