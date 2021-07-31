import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yolo/core/data/constants/app_constants.dart';
import 'package:yolo/feature/item_list_screen/repository/items_view_model.dart';
import 'package:yolo/utils/helpers.dart';

class ItemScreen extends StatefulWidget {
  static const String id = 'item_screen';
  int itemId;
  ItemScreen({required this.itemId});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late final getItemDataProvider;

  initState() {
    getProvider();
  }

  getProvider() {
    getItemDataProvider = FutureProvider((ref) async =>
        ItemsData.itemServiceProvider.getItemData(id: widget.itemId));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding:
            EdgeInsets.only(left: 30.0, right: 30, bottom: 80.0, top: 30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Consumer(
          builder: (context, watch, child) {
            final itemData = watch(getItemDataProvider);
            return itemData.when(
                data: (data) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        data.name.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 200.0,
                        height: 200.0,
                        child: Text(''),
                        decoration: BoxDecoration(
                          color: Color(getIntColor(data.color)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Year: ${data.year}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'Pantone Color: ${data.pantoneValue}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  );
                },
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (e, st) {
                  Center(
                    child: Text(e),
                  );
                });
          },
        ),
      ),
    );
  }
}
