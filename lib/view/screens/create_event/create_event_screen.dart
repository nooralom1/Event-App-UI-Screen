import 'package:flutter/material.dart';
import 'package:new_working_project/view/screens/location/location_screen.dart';

class CreateEventSheet extends StatefulWidget {
  const CreateEventSheet({super.key});

  @override
  State<CreateEventSheet> createState() => _CreateEventSheetState();
}

class _CreateEventSheetState extends State<CreateEventSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();
  final TextEditingController meetingLinkController = TextEditingController();

  String selectedType = 'Job Fair';
  bool isExternalMeeting = true;
  bool isGoLive = false;

  static const double kSpacing = 16.0;

  Future<void> _getCurrentLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LocationPickerScreen()),
    );

    if (result != null && result is Map) {
      setState(() {
        locationController.text = result['address'] ?? '';
      });
    }
  }

  Future<void> _pickDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _pickTime(TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.1,
      maxChildSize: 1.0,
      expand: false,
      shouldCloseOnMinExtent: false,
      builder: (context, scrollController) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: kSpacing,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create New Event',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Icon(Icons.cancel_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: kSpacing),
                const Divider(color: Colors.black26),
                const SizedBox(height: kSpacing),
                const Text(
                  "Event Type",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        'Job Fair',
                        'Recruiting',
                      ].map((type) => _buildTypeChip(type)).toList(),
                    ),
                    Row(
                      children: [
                        'General',
                      ].map((type) => _buildTypeChip(type)).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: kSpacing),

                // Event Title
                const Text(
                  "Event Title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                _buildTextField(titleController, hint: 'Title'),

                // Date & Time
                const SizedBox(height: kSpacing),
                const Text(
                  "Date & Time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        startDateController,
                        hint: 'Start Date',
                        readOnly: true,
                        onTap: () => _pickDate(startDateController),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                        startTimeController,
                        hint: 'Start Time',
                        readOnly: true,
                        onTap: () => _pickTime(startTimeController),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        endDateController,
                        hint: 'End Date',
                        readOnly: true,
                        onTap: () => _pickDate(endDateController),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                        endTimeController,
                        hint: 'End Time',
                        readOnly: true,
                        onTap: () => _pickTime(endTimeController),
                      ),
                    ),
                  ],
                ),

                // Location
                const SizedBox(height: kSpacing),
                const Text(
                  "Location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  locationController,
                  hint: 'Enter event location',
                  suffixIcon: GestureDetector(
                    onTap: _getCurrentLocation,
                    child: const Icon(Icons.location_on_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.map, color: Colors.blueAccent),
                  ),
                ),

                // Description
                const SizedBox(height: kSpacing),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  descriptionController,
                  hint: 'Describe your event',
                  maxLines: 4,
                ),

                // Registration Settings - Capacity
                const SizedBox(height: kSpacing),
                const Text(
                  "Registration Settings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Capacity",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  capacityController,
                  hint: 'Enter maximum attendees',
                  keyboardType: TextInputType.number,
                ),

                // Requirements
                const SizedBox(height: kSpacing),
                const Text(
                  "Requirements",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  requirementsController,
                  hint: 'Any special requirements for attendees',
                  maxLines: 2,
                ),

                // Go Live Now with right-aligned switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Go Live Now",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Switch(
                      value: isGoLive,
                      onChanged: (value) => setState(() => isGoLive = value),
                      activeColor: Colors.blue,
                    ),
                  ],
                ),

                // External Meeting with right-aligned switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "External Meeting",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Switch(
                      value: isExternalMeeting,
                      onChanged: (value) =>
                          setState(() => isExternalMeeting = value),
                      activeColor: Colors.blue,
                    ),
                  ],
                ),

                // Meeting link input (only shown when external meeting is enabled)
                if (isExternalMeeting) ...[
                  const SizedBox(height: 12),
                  TextField(
                    controller: meetingLinkController,
                    decoration: InputDecoration(
                      hintText: "Enter meeting link (Zoom, Teams, etc.)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],

                // Event Banner (placeholder)
                const SizedBox(height: kSpacing),
                const Text(
                  "Event Banner",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 40, color: Colors.grey.shade500),
                      const SizedBox(height: 8),
                      Text(
                        "Upload Event Banner",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),

                // Buttons
                const SizedBox(height: kSpacing),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(45),
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print("Event Type: $selectedType");
                          print("Event Title: ${titleController.text}");
                          print(
                            "Start: ${startDateController.text} ${startTimeController.text}",
                          );
                          print(
                            "End: ${endDateController.text} ${endTimeController.text}",
                          );
                          print("Location: ${locationController.text}");
                          print("Description: ${descriptionController.text}");
                          print("Capacity: ${capacityController.text}");
                          print("Requirements: ${requirementsController.text}");
                          print("External Meeting: $isExternalMeeting");
                          print("Meeting Link: ${meetingLinkController.text}");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Create Event"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kSpacing),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTypeChip(String type) {
    final isSelected = selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedType = type),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: isSelected
                ? null
                : Border.all(color: Colors.black26, width: 1.0),
          ),
          alignment: Alignment.center,
          child: Text(
            type,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller, {
    String? hint,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
    int? maxLines,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Colors.black26, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Colors.black26, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: Colors.black26, width: 0.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
    );
  }
}