import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoSelectionWidget extends StatefulWidget {
  final VoidCallback onGalleryTap;
  final VoidCallback onBrowseTap;
  final VideoPlayerController? videoController;

  const VideoSelectionWidget({
    super.key,
    required this.onGalleryTap,
    required this.onBrowseTap,
    this.videoController,
  });

  @override
  State<VideoSelectionWidget> createState() => _VideoSelectionWidgetState();
}

class _VideoSelectionWidgetState extends State<VideoSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.videoController == null ||
                  !widget.videoController!.value.isInitialized
              ? Colors.grey.shade200
              : Colors.black,
        ),
        child: widget.videoController == null ||
                !widget.videoController!.value.isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 40.sp,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildVideoButton(
                        icon: Icons.list,
                        label: 'Gallery',
                        onTap: widget.onGalleryTap,
                      ),
                      SizedBox(width: 16.w),
                      _buildVideoButton(
                        icon: Icons.link,
                        label: 'Browse',
                        onTap: widget.onBrowseTap,
                      ),
                    ],
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(widget.videoController!),
                    Center(
                      child: IconButton(
                        icon: Icon(
                          widget.videoController!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 40.sp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (widget.videoController!.value.isPlaying) {
                              widget.videoController!.pause();
                            } else {
                              widget.videoController!.play();
                            }
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 10.w,
                      child: Text(
                        '${widget.videoController!.value.duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${widget.videoController!.value.duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildVideoButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20.sp, color: Colors.white),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
