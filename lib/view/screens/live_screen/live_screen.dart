// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_working_project/view/screens/live_screen/dummy_data/live_dummy_data.dart';
import 'package:new_working_project/view/screens/live_screen/widget/live_view_card.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: liveData.length,
                itemBuilder: (context, index) {
                  final data = liveData[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: LiveViewCard(
                      imageUrl: data['imageUrl'],
                      profile: data['profile'],
                      name: data['name'],
                      title: data['title'],
                      view: data['registered'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
