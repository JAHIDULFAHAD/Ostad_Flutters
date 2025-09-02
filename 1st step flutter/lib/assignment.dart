import 'package:flutter/material.dart';

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[ Stack(
            children: [
              Image.network("https://th.bing.com/th/id/R.d4d60a679617fee49eaade9d97b98f7d?rik=8r7q4NWEA6tOxg&riu=http%3a%2f%2fworldbestplace.weebly.com%2fuploads%2f5%2f8%2f6%2f6%2f58661217%2f6025823_orig.jpg&ehk=G1yB9fNX3psZNFykZ4dDek9qwABcZ1q6VoxKuLl%2bfhY%3d&risl=&pid=ImgRaw&r=0"),
              Positioned(
                bottom: 100,
                  left: 30,
                  child:
                    Text("Explore the World",style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
              ),
              Positioned(
                bottom: 40,
                right: 80,
                width: 300,
                child: Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Top Destination",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
            ),
           GridView.builder(
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
                  padding: EdgeInsets.zero,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.6,
                  ),
                  itemCount: 4,
                  itemBuilder: (context,index){
                    if(index==0){
                    return Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: Container(
                            width:190,
                            height: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/R.15fa043d98f93cfb629799a920ddb1eb?rik=vO6by85Om7ybAw&riu=http%3a%2f%2ftravel-dmc.com%2fwp-content%2fuploads%2f2019%2f05%2f5-Most-Beautiful-Places-You-Must-Visit-in-Paris.jpg&ehk=red5hu%2bKuf1louv6BlFDnCjWgSDyEk1b7fgBa2Xt%2bzs%3d&risl=&pid=ImgRaw&r=0"),
                                fit: BoxFit.cover,
                              ),),
                          ),
                        ),
                        Positioned(
                          left:20,
                          bottom:5,
                          child: Text("Paris",style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),)
                      ],
                    );
                    }else if(index==1){
                      return Stack(
                        children: [
                          Positioned(
                            right: 10,
                            child: Container(
                              width:190,
                              height: 125,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://getsready.com/wp-content/uploads/2015/06/Maldives-8.jpg"),
                                    fit: BoxFit.cover,
                                  ),),
                            ),
                          ),
                          Positioned(
                            left:15,
                            bottom:5,
                            child: Text("Maldives",style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),),)
                        ],
                      );
                    }else if(index==2){
                      return Stack(
                        children: [
                          Positioned(
                            left: 10,
                            child: Container(
                              width:190,
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://th.bing.com/th/id/R.a04eb525c9c67cc2b41be1e3f1c87f86?rik=7cETpHPw11zL%2bQ&riu=http%3a%2f%2fwww.nstravel.ro%2fwp-content%2fuploads%2f2015%2f02%2femirate-dubai-dubai-burj-khalifa-oferte-dubai-oferte-emirate_6heb.jpg&ehk=Lf%2ffA%2fnblhOQbKJyL2atSNEUcV7g7KYQfP%2blJBXMXME%3d&risl=&pid=ImgRaw&r=0"),
                                  fit: BoxFit.cover,
                                ),),
                            ),
                          ),
                          Positioned(
                            left:20,
                            bottom:5,
                            child: Text("Dubai",style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),),)
                        ],
                      );
                    }else if(index==3){
                      return Stack(
                        children: [
                          Positioned(
                            right: 10,
                            child: Container(
                              width:190,
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://1.bp.blogspot.com/-56nuuQxXhbY/VvFDvKrXkbI/AAAAAAAAAKo/WtI3OxUk0NwM_SV9KRJ9XeGiO8ISgb2MA/s1600/bali1.jpg"),
                                  fit: BoxFit.cover,
                                ),),
                            ),
                          ),
                          Positioned(
                            left:15,
                            bottom:5,
                            child: Text("Bali",style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),),)
                        ],
                      );
                    }
                  }
              ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Text("Trending Package",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
              itemCount: 5,
                itemBuilder: (context,index){
                  if(index==0){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                    ),
                  child:Row(
                    children: [
                      Image.network("https://bvworldtravel.com/wp-content/uploads/2020/08/eiffel_tower_couple.jpg",height:112),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: Text("Romantic Paris Gateway",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 70),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.access_time),
                                Text(" 4 Nights - 5 Days")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children:[ Padding(
                              padding: const EdgeInsets.only(right: 52,left: 10),
                              child: Text("1000\$",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue,
                              ),),
                            ),
                              Padding(padding: const EdgeInsets.only(right: 0),
                                child: ElevatedButton(style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue
                                ),onPressed: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Booking completed successfully!'))
                                  );
                                }, child: Text("Book Now",style: TextStyle(
                                  color: Colors.white,
                                ),)),
                              )
                          ]),
                        ],
                      )
                    ],
                  )
                );}else if(index==1){
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Row(
                          children: [
                            Image.network("https://th.bing.com/th/id/R.01e885736037cc4fa4bea2806e5e30ce?rik=mh4dGPCqVJK3Fg&pid=ImgRaw&r=0",height:112),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: Text("Dubai Tour",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 65),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.access_time),
                                      Text(" 5 Nights - 6 Days")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                    children:[ Padding(
                                      padding: const EdgeInsets.only(right: 52,left: 15),
                                      child: Text("800\$",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),),
                                    ),
                                      Padding(padding: const EdgeInsets.only(right: 2),
                                        child: ElevatedButton(style:ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue
                                        ),onPressed: (){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Booking completed successfully!'))
                                          );
                                        }, child: Text("Book Now",style: TextStyle(
                                          color: Colors.white,
                                        ),)),
                                      )
                                    ]),
                              ],
                            )
                          ],
                        )
                    );
                  }else if(index==2){
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Row(
                          children: [
                            Image.network("https://th.bing.com/th/id/R.517610de0ad740a0fb28977e15fcb639?rik=cgk5p7R0qqRLsw&pid=ImgRaw&r=0",height:100),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 100),
                                  child: Text("Malaysia Tour",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 65),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.access_time),
                                      Text(" 6 Nights - 7 Days")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                    children:[ Padding(
                                      padding: const EdgeInsets.only(right: 52,left: 8),
                                      child: Text("1200\$",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),),
                                    ),
                                      Padding(padding: const EdgeInsets.only(left:0),
                                        child: ElevatedButton(style:ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue
                                        ),onPressed: (){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Booking completed successfully!'))
                                          );
                                        }, child: Text("Book Now",style: TextStyle(
                                          color: Colors.white,
                                        ),)),
                                      )
                                    ]),
                              ],
                            )
                          ],
                        )
                    );
                  }else if(index==3){
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Row(
                          children: [
                            Image.network("https://www.indiantempletour.com/blogs/wp-content/uploads/2023/04/NEpal-Tour.jpeg",height:105),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: Text("Nepal Tour",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 65),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.access_time),
                                      Text(" 3 Nights - 4 Days")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                    children:[ Padding(
                                      padding: const EdgeInsets.only(right: 52,left: 10),
                                      child: Text("600\$",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),),
                                    ),
                                      Padding(padding: const EdgeInsets.only(right: 2),
                                        child: ElevatedButton(style:ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue
                                        ),onPressed: (){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Booking completed successfully!'))
                                          );
                                        }, child: Text("Book Now",style: TextStyle(
                                          color: Colors.white,
                                        ),)),
                                      )
                                    ]),
                              ],
                            )
                          ],
                        )
                    );
                  }
            })
        ]),
      ),
    );
  }
}
