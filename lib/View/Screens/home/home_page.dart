
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty/Controller/home/home_page_controller.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/View/Widgets/Functions/rows.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:fasty/View/Widgets/Classes/grid_view.dart';
import 'package:fasty/View/Widgets/Classes/section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePagecontroller> {

  final void Function(int) toCategory;
  const HomePage({super.key, required this.toCategory});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomePagecontroller());
    controller.toCategory = toCategory;
    return  GetBuilder<HomePagecontroller>(
      builder: (controller) => ListView(
                children: [
                    Padding( 
                      padding:  const EdgeInsets.only(right: 13.5, left : 13.5, top: 8),
                      child: Column(children: [
                        searchRow((val){controller.search(val);}, (){controller.sort();}),
                        const SizedBox(height: 16,), 
                         controller.emptySearch && AllData().offers.isNotEmpty ? homeSection("Offers") : const SizedBox(),],),
                    ),
                    
          controller.emptySearch ?  Column(children: [AllData().offers.isNotEmpty ? Column(
            children: [
              SizedBox( height: 170,
                          child: PageView.builder(
                            onPageChanged: (val){
                              controller.onPageChanged(val);
                            },
                            itemCount: AllData().offers.length,
                            itemBuilder: (context, i) => Flexible( 
                              child: Padding(
                                padding : const EdgeInsets.symmetric(horizontal: 13.5),
                                          child: InkWell( overlayColor: WidgetStateProperty.all<Color>(AppColors.red),
                           borderRadius: BorderRadius.circular(20.0), onTap: AllData().offers[i].clickable != 0 ? 
                           (){controller.offerClick(AllData().offers[i]);} : null,
                              child: ClipRRect( borderRadius: BorderRadius.circular(20.0),
                            child: CachedNetworkImage(
                                          imageUrl: "${ApiLinks.offersUploadLink}/${AllData().offers[i].image}",
                                          errorWidget: (context, url, error) =>
                                           const Text("Failed to load image", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
                                          fit: BoxFit.fill,
                                          height : 140, width :360,
                                        ),
                                        )),
                            ), 
                          ),
                        )), const SizedBox(height: 7,), pagesViewDots(AllData().offers.length, 
                        300, controller.offerPage, 6.5, 8, 6.25), 
            ],
          ) : const SizedBox(), 
        
            Section(title: "Most popular", list: controller.mostPopularList, onPressed: (val){controller.changeFavorite(val);},
            
            ),
           
           const SizedBox(height: 13.5,), 
           Section(title: "Newest", list: controller.newestList, onPressed: (val){controller.changeFavorite(val);}, )
                     ],) : ItemsGridView(items: controller.searchedItems, onPressed: (val){controller.changeFavorite(val);},
                     ),
                    
            const SizedBox(height: 20,),
                    
                  ],));
  }

}