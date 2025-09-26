import 'package:flutter/material.dart';

import '../Screen/update_profile_screen.dart';
class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key, this.fromUpdateProfile,
  });
  final bool? fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: (){
          if(fromUpdateProfile ?? false){
            return;
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
        },
        child: Row(
            spacing: 8,
            children: [
              CircleAvatar(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Name',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white
                  ),),
                  Text('Jahid@gmail.com',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white
                  ),)
                ],
              )
            ]
        ),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}