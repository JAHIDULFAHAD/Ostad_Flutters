import 'package:flutter/material.dart';
import 'package:ostad_flutter/user_input.dart';

import 'assignment.dart';
import 'facebook_login.dart';
class DrawerTabbar extends StatelessWidget {
  const DrawerTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:AppBar(
          title: Text("Demo"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text:"Home",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'fav',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text:"Home",
            ),
          ]),
        ),
        body: TabBarView(children: [
          FacebookLogin(),
          Assignment(),
          UserInput()

        ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(decoration:BoxDecoration(color: Colors.grey),
              child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage("https://scontent.fzyl2-2.fna.fbcdn.net/v/t39.30808-6/488802062_2457198074624230_6438525135706119668_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeG09fuZ6FVFwG-ysSMHrgKKchxs_kj6g8ByHGz-SPqDwEVTotePi2hR5cFlaWc7O4Vnf5tvnzQFTWpz3sPqBU0O&_nc_ohc=bZ-pu_N3FEUQ7kNvwFiT1XI&_nc_oc=AdlRr68peoEtt6Z3BnCE9R9xdelROAWT-GzgdcJkrC4cKqgPO_FMHKZIDukb-5AeZgE&_nc_zt=23&_nc_ht=scontent.fzyl2-2.fna&_nc_gid=C34yHJdwTeTqlMTGBm7VBA&oh=00_AfRVcfhCjo5WcizsJzqTjRliL6hfOXXuqcioC3qN2nYWcA&oe=688B217F"),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Jahidul Haque Fahad",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
      
                    Text("jahidulh829@gmail.com",style: TextStyle(),)
                  ],
                ),
              ),
              ListTile(
                title: Text("Home",style: TextStyle(
                  fontSize: 20
                ),),
                dense: true,
                onTap: (){},
              ),
              Divider(color: Colors.blue,),
              ListTile(
                title: Text("Video",style: TextStyle(
                    fontSize: 20
                ),),
                dense: true,
                onTap: (){},
              ),
              Divider(color: Colors.blue,),
              ListTile(
                title: Text("Photo",style: TextStyle(
                    fontSize: 20
                ),),
                dense: true,
                onTap: (){},
              ),
              Divider(color: Colors.blue,),
              ListTile(
                title: Text("Setting",style: TextStyle(
                    fontSize: 20
                ),),
                dense: true,
                onTap: (){},
              ),
              Divider(color: Colors.blue,)
      
            ],
          ),
        ),
      ),
    );
  }
}
