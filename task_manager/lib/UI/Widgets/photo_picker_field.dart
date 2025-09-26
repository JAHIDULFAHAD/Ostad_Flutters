import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class PhotoPickerField extends StatelessWidget {
  const PhotoPickerField({
    super.key, required this.onTap, this.selectedPhoto,
  });
  final VoidCallback onTap;
  final XFile? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          spacing: 8,
          children: [
            Container(
              height: double.maxFinite,
              width:80,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                ),
              ),
              child: Center(child: Text("Photos")),
            ),
            Expanded(child: Text(selectedPhoto == null ? "No Photo selected" : selectedPhoto!.name,maxLines: 1,style: TextStyle(
              overflow: TextOverflow.ellipsis,
            ),))
          ],
        ),

      ),
    );
  }
}