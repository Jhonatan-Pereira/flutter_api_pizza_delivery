import 'package:json_annotation/json_annotation.dart';

import 'menu_item.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  int id;
  String name;
  List<MenuItem> items;

  Menu({
    this.id,
    this.name,
    this.items,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
