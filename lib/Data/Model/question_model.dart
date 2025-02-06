class QuestionModel {

  String? question;
  String? answer;

QuestionModel({this.question, this.answer});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}