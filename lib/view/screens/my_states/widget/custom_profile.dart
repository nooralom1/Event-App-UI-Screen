// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfile extends StatelessWidget {
  final String view;
  final String viewIncrement;
  final String rating;
  final String ratingIncrement;
  const CustomProfile({super.key, required this.view, required this.viewIncrement, required this.rating, required this.ratingIncrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Views
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 14.r,
                backgroundColor: Colors.indigoAccent.withOpacity(0.15),
                child: Center(
                  child: Icon(
                    Icons.visibility_outlined,
                    color: Colors.indigoAccent,
                  ),
                ),
              ),
              SizedBox(width: 4.sp),
              Column(
                children: [
                  Text(
                    view,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2c3e50),
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    'Profile Views',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    viewIncrement,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Average Rating
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                radius: 14.r,
                backgroundColor: Colors.indigoAccent.withOpacity(0.15),
                child: Center(
                  child: Icon(
                    Icons.star_border_outlined,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              SizedBox(width: 4.sp),
              Column(
                children: [
                  Text(
                    rating,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2c3e50),
                    ),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    'Average Rating',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    ratingIncrement,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
