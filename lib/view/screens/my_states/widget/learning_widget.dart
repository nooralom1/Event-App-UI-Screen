// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearningWidget extends StatelessWidget {
  final String count;
  final String countTitle;
  final String increment;
  final Color circleColor;
  final Color iconleColor;
  final IconData icon;
  const LearningWidget({
    super.key,
    required this.count,
    required this.increment,
    required this.circleColor,
    required this.iconleColor,
    required this.icon, required this.countTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: circleColor,
              child: Icon(icon, color: iconleColor, size: 32.sp),
            ),
            SizedBox(width: 6.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  countTitle,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          increment,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
