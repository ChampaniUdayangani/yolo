import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yolo/feature/item_list_screen/repository/items_view_model.dart';
import 'package:yolo/widgets/item_tile.dart';

class ItemList extends StatelessWidget {
  final itemServiceProvider =
      FutureProvider((ref) => ItemsData.itemServiceProvider.getAllItems());

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final getItemsAsyncData = watch(itemServiceProvider);
        return getItemsAsyncData.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Item(
                  id: data[index].id,
                  name: data[index].name,
                  year: data[index].year,
                  color: data[index].color,
                  pantoneColor: data[index].pantoneValue,
                );
              },
              itemCount: data.length,
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, st) => Text('Error occured $e'),
        );
      },
    );
  }
}
