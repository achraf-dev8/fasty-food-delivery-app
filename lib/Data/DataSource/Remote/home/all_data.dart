
import 'package:fasty/Data/Model/address_model.dart';
import 'package:fasty/Data/Model/cart_extra_model.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/category_model.dart';
import 'package:fasty/Data/Model/extra_model.dart';
import 'package:fasty/Data/Model/item_extra_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:fasty/Data/Model/offer_model.dart';
import 'package:fasty/Data/Model/question_model.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:fasty/Data/Model/size_model.dart';

class AllData {
  static final data = AllData._internal();

  factory AllData() {
    return data;
  }

  AllData._internal();

  List<CategoryModel> categories = [];
  List<ItemModel> items = [];
  List<ExtraModel> extras = [];
  List<SizeModel> sizes = [];
  List<int> favorite = [];
  List<ItemExtraModel> itemExtras = [];
  List<ItemSizeModel> itemSizes = [];
  List<CartModel> cart = [];
  List<CartExtraModel> cartExtras = [];
  List<AddressModel> addresses = [];
  List<QuestionModel> questions = [];
  List<ReviewModel> reviews = [];
  List<OfferModel> offers = [];
  int notification = 0;
  int cartBool = 0;
  
  void restart(){
    categories = [];
  items = [];
   extras = [];
   sizes = [];
  favorite = [];
  itemExtras = [];
   itemSizes = [];
  cart = [];
   cartExtras = [];
   addresses = [];
   questions = [];
  reviews = [];
  offers = [];
  }


}