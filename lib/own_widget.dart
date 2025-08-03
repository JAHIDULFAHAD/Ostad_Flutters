import 'package:flutter/material.dart';
import 'package:ostad_flutter/city_card.dart';

class OwnWidget extends StatelessWidget {
  const OwnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Own Widget"),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CityCard(img: "https://res.cloudinary.com/jerrick/image/upload/v1687258926/6491872d1f962c001de086fa.jpg", city: "dhaka"),
                SizedBox(width: 10,),
                CityCard(img: "https://res.cloudinary.com/jerrick/image/upload/v1687258926/6491872d1f962c001de086fa.jpg", city: "dhaka"),
                SizedBox(width: 10,),
                CityCard(img: "https://res.cloudinary.com/jerrick/image/upload/v1687258926/6491872d1f962c001de086fa.jpg", city: "dhaka"),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
