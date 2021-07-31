import 'package:yolo/core/data/constants/app_constants.dart';
import 'package:yolo/core/services/networking/http_service.dart';
import 'package:yolo/models/item_model.dart';

const url = '$appUrl/items';

class ItemService {
  static final HttpService httpService = HttpService();

  Future<dynamic> getItems() async {
    try {
      List<Item> items = [];
      var returnedData = await httpService.get(url);
      if (returnedData != null) {
        var itemsData = returnedData.data['data'];
        itemsData.forEach((item) {
          items.add(
            Item(
                id: item['id'],
                name: item['name'],
                year: item['year'],
                color: item['color'],
                pantoneValue: item['pantone_value']),
          );
        });

        return items;
      }
    } catch (e) {
      print('Error occured: $e');
    }
  }

  Future<dynamic> getItemById(int id) async {
    try {
      var returedItem = await httpService.get('$url/$id');
      if (returedItem != null) {
        var itemData = returedItem.data['data'];

        Item item = Item(
          id: itemData['id'],
          name: itemData['name'],
          year: itemData['year'],
          color: itemData['color'],
          pantoneValue: itemData['pantone_value'],
        );
        return item;
      }
      return ('Empty Object');
    } catch (e) {
      print('Error occured: $e');
    }
  }
}
