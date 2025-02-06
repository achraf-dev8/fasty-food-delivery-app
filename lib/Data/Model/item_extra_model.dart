class ItemExtraModel {
  int? item;
  int? extra;

  ItemExtraModel(
      {this.item,
      this.extra});

  ItemExtraModel.fromJson(Map<String, dynamic> json) {
    item  = json['item'];
    extra  = json['extra'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item.toString();
    data['extra'] = extra.toString();
    
    return data;
  }        
}