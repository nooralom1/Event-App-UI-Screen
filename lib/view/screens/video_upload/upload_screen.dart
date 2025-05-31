// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_interpolation_to_compose_strings, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_working_project/view/screens/video_upload/widget/custom_input_field.dart';
import 'package:new_working_project/view/screens/video_upload/widget/video_selection_widget.dart';
import 'package:new_working_project/view/screens/video_upload/widget/visibility_selection_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  State<VideoUploadScreen> createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  VideoPlayerController? _videoController;
  String _visibility = 'Public';
  final TextEditingController _captionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // Unified permission request logic
  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.status;
    print('${permission.toString()} status: $status');
    if (status.isGranted) return true;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${permission.toString().split('.').last} access permanently denied. Please enable it in settings.',
          ),
        ),
      );
      return false;
    }
    final newStatus = await permission.request();
    print('${permission.toString()} after request: $newStatus');
    if (newStatus.isGranted) return true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${permission.toString().split('.').last} access denied.'),
      ),
    );
    return false;
  }

  // Generalized video picking logic
  Future<void> _pickVideo(ImageSource source) async {
    try {
      final permission =
          source == ImageSource.gallery ? Permission.photos : Permission.camera;
      final sourceName = source == ImageSource.gallery ? 'gallery' : 'camera';
      final hasPermission = await _requestPermission(permission);
      if (!hasPermission) return;

      print('Opening $sourceName...');
      final XFile? video = await _picker.pickVideo(source: source);
      if (video == null) {
        print('No video selected from $sourceName.');
        return;
      }

      print('Video selected from $sourceName: ${video.path}');
      _videoController?.dispose();
      setState(() {
        _videoController = VideoPlayerController.file(File(video.path))
          ..initialize().then((_) {
            setState(() {});
            _videoController?.play();
          }).catchError((error) {
            print('Error initializing video: $error');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error playing video: $error')),
            );
          });
      });
    } catch (e) {
      print('Error accessing $source: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to access $source: $e')),
      );
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            VideoSelectionWidget(
              onGalleryTap: () => _pickVideo(ImageSource.gallery),
              onBrowseTap: () => _pickVideo(ImageSource.camera),
              videoController: _videoController,
            ),
            SizedBox(height: 16.h),
            CustomInputField(
              label: 'Caption',
              hintText: 'Write a caption...',
              controller: _captionController,
              maxLines: 3,
              maxLength: 150,
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Cover',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.arrow_upward,
                      size: 30.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => _pickVideo(ImageSource.gallery),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Select cover',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            VisibilitySelectionWidget(
              selectedVisibility: _visibility,
              onVisibilitySelected: (visibility) {
                setState(() {
                  _visibility = visibility;
                });
              },
            ),
            SizedBox(height: 16.h),
            CustomInputField(
              label: 'Location',
              hintText: 'Add location',
              prefixIcon: Icons.location_on_outlined,
            ),
            SizedBox(height: 16.h),
            CustomInputField(
              label: 'Mention',
              hintText: 'Mention users with @',
              prefixIcon: Icons.alternate_email,
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}