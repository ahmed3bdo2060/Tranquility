part of 'bloc.dart';
class CartData {

  late final List<ProductModel> list;
  late final int totalPriceBeforeDiscount;
  late final double totalDiscount;
  late final double totalPriceWithVat;
  late final int deliveryCost;
  late final int freeDeliveryPrice;
  late  num vat;
  late final int isVip;
  late final int vipDiscountPercentage;
  late final int minVipPrice;
  late final String vipMessage;
  late final String status;
  late final String message;
  double get totalBeforeDiscount{
   double result = 0;
   list.forEach((element) {
     result+=element.priceBeforeDiscount*element.amount;
   });
   return result;
  }
  double get totalAfterDiscount{
    double result = 0;
    list.forEach((element) {
      result+=element.price*element.amount;
    });
    return result;
  }
  String get totalDiscountCart{
    return (totalBeforeDiscount-totalAfterDiscount).toStringAsFixed(2);
  }

  CartData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data'??[]]).map((e)=>ProductModel.fromJson(e)).toList();
    totalPriceBeforeDiscount = json['total_price_before_discount']??0;
    totalDiscount = json['total_discount']??0;
    totalPriceWithVat = json['total_price_with_vat']??0;
    deliveryCost = json['delivery_cost']??0;
    freeDeliveryPrice = json['free_delivery_price']??0;
    vat = json['vat']??0;
    vat*=100;
    isVip = json['is_vip']??0;
    vipDiscountPercentage = json['vip_discount_percentage']??0;
    minVipPrice = json['min_vip_price']??0;
    vipMessage = json['vip_message']??"";
    status = json['status']??"";
    message = json['message']??"";
  }


}

class ProductModel {
  late final int id;
  late final String title;
  late final String image;
  late  int amount;
  late final int priceBeforeDiscount;
  late final int discount;
  late final num price;
  late final int remainingAmount;
  void plus(){
    if(amount<remainingAmount){
      amount++;
    }
  }
  void minus(){
    if(amount>1){
      amount--;
    }
  }



  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    title = json['title']??"";
    image = json['image']??"";
    amount = json['amount']??0;
    priceBeforeDiscount = json['price_before_discount']??0;
    discount = json['discount']??0;
    price = json['price']??0;
    remainingAmount = json['remaining_amount']??0;
  }
}