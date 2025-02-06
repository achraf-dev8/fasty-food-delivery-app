

import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/Model/question_model.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController{
  late List<QuestionModel> questions = [];
  int selectedQuestion = -1;
  @override
  void onInit(){
    questions = AllData().questions;
    update();
    super.onInit();
  }
  selectQuestion(int i){
    if(selectedQuestion == i){
      selectedQuestion = -1;
    }else{
      selectedQuestion = i;
    }
    update();
  }
  search(String text){

    questions = AllData().questions.where((question) => question.question!.toLowerCase().
    contains(text.toLowerCase())).toList();
    update();
  }
  }



