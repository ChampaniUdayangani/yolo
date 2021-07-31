import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yolo/core/data/constants/items_screen_constants.dart';
import 'package:yolo/widgets/item_list.dart';

class ItemsScreen extends StatelessWidget {
  static const String id = 'items_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: AppBar(
        title: Text('Pantone Colors'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 30.0,
        ),
        child: Column(
          children: [
            Text(
              'Explore Pantone Colors!!!',
              style: titleStyle,
            ),
            Expanded(
              child: Container(
                child: ItemList(),
              ),
            )
            // ItemList(),
          ],
        ),
      ),
    );
  }
}
