import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Ui/Controllers/auth_controller.dart';
import 'package:task_manager/Ui/Screen/login_screen.dart';
import '../Screen/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? fromUpdateProfile;

  const TMAppBar({super.key, this.fromUpdateProfile});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<AuthController>().userModel;
    final profilePhoto = userModel?.photo ?? '';

    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromUpdateProfile ?? false) return;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UpdateProfileScreen()),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              child: profilePhoto.isNotEmpty
                  ? Image.memory(base64Decode(profilePhoto))
                  : Icon(Icons.person),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel?.fullName ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  userModel?.email ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await context.read<AuthController>().clearUserData();
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.name,
                  (predicate) => false,
            );
          },
          icon: Icon(Icons.logout_outlined),
        ),
      ],
    );
  }
}
