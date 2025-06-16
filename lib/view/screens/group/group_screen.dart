// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_working_project/view/screens/group/widget/add_item_dialouge.dart';
import 'package:new_working_project/view/screens/group/widget/group_chat_container.dart';
import 'package:new_working_project/view/screens/group/widget/group_members_container.dart';
import 'package:new_working_project/view/screens/group/widget/invite_friend_container.dart';
import 'package:new_working_project/view/screens/group/widget/packing_list_container.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _assignToController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  void _addItem() async {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(
          itemNameController: _itemNameController,
          categoryController: _categoryController,
          assignToController: _assignToController,
          quantityController: _quantityController),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Text(
                "Invite Friends",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              InviteCard(
                inviteLink: 'https://girlstrip.app/joir',
                inviteCode: '847291',
                textOnTap: () {},
                emailOnTap: () {},
                socialOnTap: () {},
              ),
              SizedBox(height: 16.h),
              Text(
                "Group Chat",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              GroupChatContainer(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Group Members",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "3",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              GroupMembersContainer(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Packing List",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: _addItem,
                    child: Text(
                      "+ Add Item",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              PackingListContainer(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
