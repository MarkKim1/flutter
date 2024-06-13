import 'package:flutter/material.dart';
import 'category.dart';
class CategoryName extends StatelessWidget {

  final String name;

  CategoryName(
    {
    required this.name,
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}