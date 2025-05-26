// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_working_project/view/screens/hosting_events/dummy_data/event_list.dart';
import 'package:new_working_project/view/screens/hosting_events/widget/events_view_card.dart';

class HostedEventsScreen extends StatefulWidget {
  const HostedEventsScreen({super.key});

  @override
  State<HostedEventsScreen> createState() => _HostedEventsScreenState();
}

class _HostedEventsScreenState extends State<HostedEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Row(
                children: [
                  Text(
                    'Events You\'re Hosting',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventsViewCard(
                    imageUrl: event['imageUrl'],
                    title: event['title'],
                    date: event['date'],
                    location: event['location'],
                    registered: event['registered'],
                    status: event['status'],
                    detailsOnTap: () {},
                    editOnTap: () {},
                    cancelOnTap: () {},
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
