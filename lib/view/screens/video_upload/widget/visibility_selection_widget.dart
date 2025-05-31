import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisibilitySelectionWidget extends StatelessWidget {
  final String selectedVisibility;
  final Function(String) onVisibilitySelected;

  const VisibilitySelectionWidget({
    super.key,
    required this.selectedVisibility,
    required this.onVisibilitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Visibility',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildVisibilityButton(
                icon: Icons.list,
                label: 'Public',
                isSelected: selectedVisibility == 'Public',
                onTap: () => onVisibilitySelected('Public'),
              ),
              _buildVisibilityButton(
                icon: Icons.person,
                label: 'Friends',
                isSelected: selectedVisibility == 'Friends',
                onTap: () => onVisibilitySelected('Friends'),
              ),
              _buildVisibilityButton(
                icon: Icons.lock,
                label: 'Private',
                isSelected: selectedVisibility == 'Private',
                onTap: () => onVisibilitySelected('Private'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisibilityButton({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade50 : Colors.blueGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isSelected ? Colors.pink : Colors.grey,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? Colors.pink : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
