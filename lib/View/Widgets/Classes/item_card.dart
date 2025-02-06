import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/add_to_cart.dart';
import 'package:fasty/Core/Functions/get_prices.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class ItemCard extends StatelessWidget {
  final ItemModel item;
  final bool favorite;
  final void Function() onPressed;
  static CartData cartData = CartData(Get.find());
  const ItemCard({
    super.key, required this.item, required this.favorite, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2.5,
        child: InkWell(
        overlayColor: WidgetStateProperty.all<Color>(AppColors.itemClickGrey),
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Get.toNamed(AppRoutes.itemInformation, arguments: {"item" : item});
          },
          child: Container(
            width: 155,
            height: 252,
            padding: EdgeInsets.only(left: 6.5),
            child: Column(       
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(height: 0.5,),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                    !favorite ? Icons.favorite_border : Icons.favorite,
                    color:  !favorite ?  Colors.black : Colors.red,
                    ),
                  ),
                ),Spacer(),
                CachedNetworkImage(
                  imageUrl: "${ApiLinks.itemsUploadLink}/${item.image}",
                  height: 92,
                  width: 92,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: AutoSizeText( 
                    item.name!,
                    textAlign: TextAlign.center,
                    minFontSize: 10,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: item.name!.length <= 13 ? 18 : 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidStar,
                      color: AppColors.yellow,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                     item.rating != 0 ? item.rating!.toString() : "No ratings yet",
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellow,
                          fontSize: item.rating != 0 ? 18 : 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    fullPriceInfo(
                        getPrices(item, "price"), getPrices(item, "old_price"), 
                        13.75, 18.25),
                    const Spacer(),
                    Container(
                      width: 28, height: 28,
                      decoration: const BoxDecoration(color: AppColors.organgeYellow,
                        shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          color: AppColors.white,
                          size: 14,
                        ),
                        onPressed: () async{
                          await addOneToCart(item, cartData);
                        },
                      ),
                    ), SizedBox(width: 9,)
                  ],
                ),
                   const Spacer(),
                   const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }}
