import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/asset_paths.dart';
class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SvgPicture.asset(
            AssetPaths.background,
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          SafeArea(child: child)
        ]
    );
  }
}
