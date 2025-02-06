


import 'package:fasty/Controller/account/question_controller.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/question_column.dart';
import 'package:fasty/View/Widgets/Classes/search_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Questions extends GetView<QuestionController> {
  const Questions({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> QuestionController());
    return Scaffold(
      body:
                ListView(children: [
            authPadding(Column( 
              children: [
            textBackButtonAppBar(context, "FAQ"),
            const SizedBox(height: 24,),
            SearchTextfeild(search: (val){controller.search(val);}, fontSize:  18),
            const SizedBox(height: 19,),
            
            GetBuilder<QuestionController>(builder: (controller) => ListView.builder(shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), itemCount: 
            controller.questions.length, itemBuilder: (context, i)=> QuestionColumn(
              question: controller.questions[i].question!, answer: controller.questions[i].answer!,
              onTap: (){controller.selectQuestion(i);}, shown: controller.selectedQuestion == i,
            ),))
            
             
              ],
            ))
          
            ]),
        
    );
  }}
