import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_working_project/view/screens/live_screen/live_screen.dart';
import 'package:new_working_project/view/screens/video_upload/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LiveScreen());
                    // showModalBottomSheet(
                    //   backgroundColor: Colors.white,
                    //   context: context,
                    //   isScrollControlled:
                    //       true, // Makes the bottom sheet expandable
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //       top: Radius.circular(20), // Rounded top corners
                    //     ),
                    //   ),
                    //   builder: (context) {
                    //     return const EventDetailsSheet();
                    //   },
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Live Screen"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => VideoUploadScreen());
                    // showModalBottomSheet(
                    //   backgroundColor: Colors.white,
                    //   context: context,
                    //   isScrollControlled:
                    //       true, // Makes the bottom sheet expandable
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //       top: Radius.circular(20), // Rounded top corners
                    //     ),
                    //   ),
                    //   builder: (context) {
                    //     return const CreateEventSheet();
                    //   },
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Video Upload Screen"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
