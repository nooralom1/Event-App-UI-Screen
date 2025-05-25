import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityModel {
  final Color circleColor;
  final IconData icon;
  final String title;
  final String subTitle;
  final String trailing;

  ActivityModel({
    required this.circleColor,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.trailing,
  });
}

List<ActivityModel> activityData = [
  ActivityModel(
    icon: Icons.remove_red_eye,
    title: 'Profile viewed by Company XYZ',
    subTitle: '2 hours ago',
    trailing: '+1',
    circleColor: Colors.indigoAccent,
  ),
  ActivityModel(
    icon: Icons.send,
    title: 'Application submitted to TechCorp',
    subTitle: '1 day ago',
    trailing: 'Applied',
    circleColor: Colors.orange,
  ),
  ActivityModel(
    icon: Icons.videocam,
    title: 'Video "Portfolio Showcase" viewed',
    subTitle: '2 days ago',
    trailing: '+15',
    circleColor: Colors.pink,
  ),
  ActivityModel(
    icon: Icons.send,
    title: 'Application submitted to DevInc',
    subTitle: '3 days ago',
    trailing: 'Applied',
    circleColor: Colors.orange,
  ),
  ActivityModel(
    icon: Icons.star,
    title: 'New rating received',
    subTitle: '5 days ago',
    trailing: '5.0',
    circleColor: Colors.purple,
  ),
];
