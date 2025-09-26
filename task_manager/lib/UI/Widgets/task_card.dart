import 'package:flutter/material.dart';
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.title, required this.description, required this.date, required this.status,
  });
  final String title;
  final String description;
  final String date;
  final String status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Colors.white,
      title: Text(title),
      subtitle: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          Text("Date: $date",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600
          ),),
          Row(
            children: [
              Chip(
                label: Text(status),backgroundColor: Colors.blue,
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.grey,),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Colors.grey,)
            ],
          )
        ],
      ),
    );
  }
}