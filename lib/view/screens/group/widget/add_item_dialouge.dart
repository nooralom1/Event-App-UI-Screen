import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({
    super.key,
    required TextEditingController itemNameController,
    required TextEditingController categoryController,
    required TextEditingController assignToController,
    required TextEditingController quantityController,
  })  : _itemNameController = itemNameController,
        _categoryController = categoryController,
        _assignToController = assignToController,
        _quantityController = quantityController;

  final TextEditingController _itemNameController;
  final TextEditingController _categoryController;
  final TextEditingController _assignToController;
  final TextEditingController _quantityController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add Packing Item"),
          IconButton(
            icon: Icon(Icons.close, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: "Item Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: "Category",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _assignToController,
              decoration: InputDecoration(
                labelText: "Assign To",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            _itemNameController.clear();
            _categoryController.clear();
            _assignToController.clear();
            _quantityController.clear();
          },
          child: Text(
            "Cancel",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_itemNameController.text.isNotEmpty &&
                _categoryController.text.isNotEmpty &&
                _assignToController.text.isNotEmpty &&
                _quantityController.text.isNotEmpty) {
              print("Added: ${_itemNameController.text}, "
                  "Category: ${_categoryController.text}, "
                  "Assigned to: ${_assignToController.text}, "
                  "Quantity: ${_quantityController.text}");
              Navigator.pop(context);
              _itemNameController.clear();
              _categoryController.clear();
              _assignToController.clear();
              _quantityController.clear();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            "Add Item",
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
