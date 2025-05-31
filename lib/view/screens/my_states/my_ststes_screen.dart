// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_working_project/view/screens/my_states/model/activity_model.dart';
import 'package:new_working_project/view/screens/my_states/widget/activity_tile.dart';
import 'package:new_working_project/view/screens/my_states/widget/custom_card.dart';
import 'package:new_working_project/view/screens/my_states/widget/custom_profile.dart';
import 'package:new_working_project/view/screens/my_states/widget/learning_widget.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String _activeTab = 'Week'; // Default active tab

  void _setActiveTab(String tab) {
    setState(() {
      _activeTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {}, child: Icon(Icons.arrow_back)),
        title: Text(
          'My Stats',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTabButton(
                    context,
                    'Week',
                    _activeTab == 'Week',
                    () => _setActiveTab('Week'),
                  ),
                  _buildTabButton(
                    context,
                    'Month',
                    _activeTab == 'Month',
                    () => _setActiveTab('Month'),
                  ),
                  _buildTabButton(
                    context,
                    'Year',
                    _activeTab == 'Year',
                    () => _setActiveTab('Year'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            // Profile Performance
            CustomCardWidget(
              title: 'Profile Performance',
              subtitle: 'Last updated: Today, 10.45 AM',
              child: CustomProfile(
                view: '4,328',
                viewIncrement: '↑ 15.3%',
                rating: '4.8',
                ratingIncrement: '↑ 2.1%',
              ),
            ),
            SizedBox(height: 8.h),
            // Learning
            CustomCardWidget(
              title: 'Learning',
              subtitle: 'Sessions attended',
              child: LearningWidget(
                icon: Icons.list,
                iconleColor: Colors.indigoAccent,
                circleColor: Colors.indigoAccent.withOpacity(0.15),
                count: "24",
                countTitle: '1-on-1 Mentor/Tutor Sessions',
                increment: '↑ 18.5% from last period',
              ),
            ),

            SizedBox(height: 8.h),
            // Video Performance
            CustomCardWidget(
              title: 'Video Performance',
              subtitle: 'Last 7 days',
              child: LearningWidget(
                icon: Icons.videocam,
                iconleColor: Colors.pink,
                circleColor: Colors.pink.withOpacity(0.15),
                count: '28,764',
                countTitle: 'Total Views',
                increment: '↑ 23.7% from last period',
              ),
            ),

            SizedBox(height: 8.h),
            // Network Growth
            CustomCardWidget(
              title: 'Network Growth',
              subtitle: 'This month',
              child: LearningWidget(
                icon: Icons.person_add,
                iconleColor: Colors.purple,
                circleColor: Colors.purple.withOpacity(0.15),
                count: '847',
                countTitle: 'New Followers',
                increment: '↑ 32.5% from last month',
              ),
            ),

            SizedBox(height: 8.h),
            // Applications
            CustomCardWidget(
              title: 'Applications',
              subtitle: 'Total submitted',
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "42",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Applications applied",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8.h),
            // Recent Activity
            CustomCardWidget(
              title: 'Recent Activity',
              subtitle: 'Last 5 events',
              seeAll: "See All",
              seeAllTap: () {},
              child: ListView.builder(
                itemCount: activityData.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return CustomActivityTile(
                    circleColor: activityData[index].circleColor,
                    icon: activityData[index].icon,
                    title: activityData[index].title,
                    subTitle: activityData[index].subTitle,
                    trailing: activityData[index].trailing,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(
    BuildContext context,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isActive ? Colors.indigoAccent : null,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
