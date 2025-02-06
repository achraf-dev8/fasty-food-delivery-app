import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  final Function(String, int, int) edit;
  final Function(int) delete;
  final Function()? onPressed;
  final ItemModel item;

  const ReviewCard({
    super.key,
    required this.review,
    required this.edit,
    required this.delete,
    required this.item,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Card(
        color: Colors.white, // Ensure you have a color for AppColors.white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row( crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                   Text(review.name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  const  Spacer(), Padding(
                     padding: const EdgeInsets.only(top: 2.0),
                     child: Text(
                             review.rating.toString(),
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: AppColors.yellow,
                               fontSize: 21,
                             ),
                           ),
                   ),  Icon(
                           FontAwesomeIcons.solidStar,
                           color: AppColors.yellow,
                           size: 16.5,
                         ),
                         SizedBox(width: 4),
                           ],
                         ), Text(Jiffy.parse(review.date!).fromNow(), style:const TextStyle(fontSize: 15.25, color: AppColors.darkGrey),),
                          const SizedBox(height: 6.5,),
                         Text(review.comment!, style: const TextStyle(fontSize: 17, 
                         color: AppColors.textFieldDarkGrey),),
                                                Visibility( visible: review.user == sharedPrefs.getInt("id"),
          
                           child: SizedBox(
                            height: 35,
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 textButton("Edit", () async{
                                   await reviewDialog(item.id!, "Edit", review.id!
                                 , TextEditingController(text: review.comment!), (review){},  edit);
                                 
                                 }
                                 , const TextStyle(fontSize: 16, 
                                 color: AppColors.darkGrey)),
          
                                  textButton("Delete", () async{
                                    await delete(review.id!);
                                    }
                                 , const TextStyle(fontSize: 16, 
                                 color: AppColors.darkGrey)),
          
                               ],
                             ),
                           ),
                         )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*

*/
  
  
  
  
