import 'package:flutter/material.dart';
import 'package:name_app/main.dart';
import 'category.dart';
import 'category_name.dart';

class EachCategoryTemplate extends StatelessWidget {
  final String name;
  final String imgName;
  final String describe;

  EachCategoryTemplate(
      {required this.name,
        required this.imgName,
        required this.describe
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EachCategoryView(
              categoryName: name,
            )
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imgName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent
                        ])),
              ),
            ),
            Row(
              children: [
                CategoryName(name: describe), // shows the name of the each Category on picture
              ],
            ),
          ],
        ),
      ),
    );
  }
}
