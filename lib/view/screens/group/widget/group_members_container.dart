// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupMembersContainer extends StatelessWidget {
  const GroupMembersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(10.sp),
        children: [
          MemberItem(
            initials: "SW",
            name: "Sophia Williams",
            status: "Organizer",
            statusColor: Colors.pinkAccent,
            onDelete: () {},
          ),
          MemberItem(
            initials: "OD",
            name: "Olivia Davis",
            status: "Confirmed",
            statusColor: Colors.green,
            onDelete: () {},
          ),
          MemberItem(
            initials: "AW",
            name: "Ava Wilson",
            status: "Pending",
            statusColor: Colors.orangeAccent,
            onDelete: () {},
          ),
        ],
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  final String initials;
  final String name;
  final String status;
  final Color statusColor;
  final VoidCallback onDelete;

  const MemberItem({
    super.key,
    required this.initials,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: statusColor,
                radius: 15.r,
                child: Text(
                  initials,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.pinkAccent, size: 20.sp),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
