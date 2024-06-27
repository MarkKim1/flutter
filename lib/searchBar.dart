import 'package:flutter/material.dart';
import 'package:name_app/main.dart';
Widget searchBarDesign(BuildContext context){
  return GestureDetector(
    onTap: () {
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(),
      );
    },
    child: Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24.0)
      ),
      child: Row(
          children: <Widget> [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Text(
              'Search For Troubleshoot...',
              style: TextStyle(color: Colors.grey),
            )
          ]
      ),
    ),
  );
}
