import 'package:flutter/material.dart';
import 'package:yolo/utils/helpers.dart';

import '../feature/item_list_screen/detailed_item_screen.dart';

class Item extends StatelessWidget {
  final int id;
  final String name;
  final int year;
  final String pantoneColor;
  final String color;

  Item({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => ItemScreen(
                  itemId: id,
                ));
      },
      child: Container(
        height: 100.0,
        child: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100.0,
                  child: Text(''),
                  decoration: BoxDecoration(
                    color: Color(getIntColor(color)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name.toUpperCase(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Year: ${year.toString()}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'Pantone Color: ${pantoneColor}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
