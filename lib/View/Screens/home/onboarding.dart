import 'package:fasty/Controller/onboarding-controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/Data/DataSource/static.dart';

import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Classes/pages_view_dots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding ({super.key});
  @override
  Widget build(BuildContext context) {
      Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12, right:4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logo,
                    height: 65,
                    width: 65,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: textButton("Skip", (){controller.skip();}, const TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),)
                  ),
                ],
              ),
            ),
                        Flexible(
              child: PageView.builder(controller: controller.pgController,
                onPageChanged: (val){
                controller.onPageChanged(val);
                },
                itemCount: onBoardingList.length,
                itemBuilder: (context, i) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    Image.asset(
                      onBoardingList[i].image,
                      height: 140,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      onBoardingList[i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      onBoardingList[i].desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<OnBoardingController>(
             builder: (controller) => Flexible(child: Column(mainAxisSize: MainAxisSize.min,
              children: [  const SizedBox(height: 20),    Flexible(
                      child: PagesViewDots(list :onBoardingList, animeDuration:  controller.animDration,currentPage:  
                      controller.currentPage, slectedSize:  8, unselectedSize:  9.5,padding:  9),
                    ), const SizedBox(height: 30),
                    nextButton((){controller.next();}, controller.currentPage !=onBoardingList.length-1 ? 
        "Next" : "Let's Go")
                    
                    ],),))
        /*
            GetBuilder<OnBoardingController>(
             builder: (controller) => Flexible(
               child: Column(
          children: [
        Flexible(
          child: PagesViewDots(list :onBoardingList, animeDuration:  controller.animDration,currentPage:  
          controller.currentPage, slectedSize:  8, unselectedSize:  9.5,padding:  9),
        ),      const SizedBox(height: 15),
        Flexible(child: nextButton((){controller.next();}, controller.currentPage !=onBoardingList.length-1 ? 
        "Next" : "Let's Go")),
         ],), 
             ), ),
             */
          ],
        ),
      ),
    );
  }
}
