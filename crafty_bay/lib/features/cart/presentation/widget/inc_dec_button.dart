import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChange});
  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (_count > 1) {
              _count--;
              widget.onChange(_count);
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.remove, color: Colors.white, size: 20),
          ),
        ),
        Text('$_count', style: TextTheme.of(context).titleLarge),
        GestureDetector(
          onTap: () {
            _count++;
            widget.onChange(_count);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
