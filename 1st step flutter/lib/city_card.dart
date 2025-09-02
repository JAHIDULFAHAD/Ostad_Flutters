import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final img,city;
  const CityCard({super.key,required this.img,required this.city});

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Positioned(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                left:20,
                bottom:50,
                child: Text(city,style: Theme.of(context).textTheme.headlineMedium,),
              )
          ]);
  }
}
