import 'package:flutter/cupertino.dart';
import 'package:yolo/feature/item_list_screen/repository/item_service.dart';

class ItemsData extends ChangeNotifier {
  static final itemServiceProvider = ItemsData();

  ItemService itemService = ItemService();

  Future<dynamic> getAllItems() async {
    var data = await itemService.getItems();
    return data;
  }

  Future<dynamic> getItemData({required int id}) {
    var data = itemService.getItemById(id);
    return data;
  }
}
