import 'package:flutter/foundation.dart';
import 'package:group_buying_application/Model/catalog_model.dart';

class FavoriteModel extends ChangeNotifier {
  //私人領域支援
  late CatalogModel _catalog;

  // 喜愛商品的內部私有狀態，儲存每個 id
  final List<int> _itemIds = [];

  // 目前的喜愛商品目錄
  CatalogModel get catalog => _catalog;

  // 每當喜愛商品項的內容改變時需更新
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  //喜愛商品列表
  List<Items> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // 加入喜愛商品，從外部修改的唯一方法
  void add(Items item) {
    _itemIds.add(item.id);

    notifyListeners();
  }

  // 從喜愛商品那裡取消收藏
  void remove(Items item) {
    _itemIds.remove(item.id);

    notifyListeners();
  }
}
