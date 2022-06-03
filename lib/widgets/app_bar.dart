import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/default.jpg'),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Group Payment Demo',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              'John Doe, Jack Doe, Jane Doe, Sarah Doe, Jake Doe',
              style: TextStyle(fontSize: 12),
            )
          ],
        )
      ],
    ),
  );
}
