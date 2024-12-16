import 'package:flutter/material.dart';

// 隨意取的名稱
class CatalogModel {
  static List<String> itemNames = [
    'Down Jacket 羽絨外套',
    'Flying Fish 飛魚餅',
    'Convenience Food 方便食',
    'Imported Milk 進口牛奶',
    'Tissue 舒爽面紙',
    'Sashimi 生魚塊',
    'Popcorn 香甜爆米花',
    'Sports Tops 運動上衣',
    'New Year Dishes 團圓年菜',
    'Sausage 美味香腸',
    'Squid 新鮮生魷魚',
    'Lipstick 口紅',
    'Windproof Jacket 暖外套',
    'Shredded Squid 魷魚絲',
    'Thermos Cup 保溫杯',
    'Soda Crackers 蘇打餅乾',
    'Iphone 16s 手機',
    'Snack 涮嘴零食',
  ];

  // 隨意訂的價格
  static List<String> itemPrice = [
    'NT\$ 1,180',
    'NT\$ 110',
    'NT\$ 820',
    'NT\$ 2,060',
    'NT\$ 320',
    'NT\$ 130',
    'NT\$ 60',
    'NT\$ 720',
    'NT\$ 1,660',
    'NT\$ 240',
    'NT\$ 190',
    'NT\$ 660',
    'NT\$ 3,080',
    'NT\$ 90',
    'NT\$ 450',
    'NT\$ 55',
    'NT\$ 31,080',
    'NT\$ 270',
  ];

  // 隨意抓的圖片
  static List<Image> imageItem = [
    Image.asset(
      'images/commodity/commodity1.webp',
    ),
    Image.asset(
      'images/product/flyingFish.png',
    ),
    Image.asset(
      'images/commodity/commodity2.webp',
    ),
    Image.asset(
      'images/commodity/commodity3.webp',
    ),
    Image.asset(
      'images/commodity/commodity4.webp',
    ),
    Image.asset(
      'images/commodity/commodity5.webp',
    ),
    Image.asset(
      'images/product/popcorn.png',
    ),
    Image.asset(
      'images/commodity/commodity6.webp',
    ),
    Image.asset(
      'images/commodity/commodity7.webp',
    ),
    Image.asset(
      'images/commodity/commodity8.webp',
    ),
    Image.asset(
      'images/commodity/commodity9.webp',
    ),
    Image.asset(
      'images/commodity/commodity10.webp',
    ),
    Image.asset(
      'images/commodity/commodity11.webp',
    ),
    Image.asset(
      'images/product/shreddedSquid.png',
    ),
    Image.asset(
      'images/commodity/commodity12.webp',
    ),
    Image.asset(
      'images/commodity/commodity13.webp',
    ),
    Image.asset(
      'images/commodity/commodity14.webp',
    ),
    Image.asset(
      'images/commodity/commodity15.webp',
    ),
  ];

  int itemLength = itemNames.length;

  Items getById(int id) => Items(id, itemNames[id % itemNames.length]);

  Items getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Items {
  final int id;
  final String name;
  final Image image;

  Items(
    this.id,
    this.name,
  ) : image = CatalogModel.imageItem[id % CatalogModel.imageItem.length];

  // 該物件的 hashCode (哈希碼)，所有的物件都有 hashCode
  @override
  int get hashCode => id;

  // is 為判斷是否為某個類型
  @override
  bool operator ==(Object other) => other is Items && other.id == id;
}
