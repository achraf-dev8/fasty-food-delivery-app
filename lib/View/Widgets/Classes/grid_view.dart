

import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/View/Widgets/Classes/item_card.dart';
import 'package:flutter/material.dart';

class ItemsGridView extends StatelessWidget {
  final List<ItemModel> items;
  final void Function(int) onPressed;
  const ItemsGridView({super.key, required this.items, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GridView.builder( 
                  itemCount: items.length,
                  shrinkWrap : true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
                mainAxisSpacing: 2, childAspectRatio: 0.63),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => ItemCard(item: items[i], favorite: AllData().favorite.contains(items[i].id!), 
                onPressed: (){onPressed(items[i].id!);}),
                      );
  }

}