// ignore_for_file: unnecessary_this

class CouponCode {
  int? id;
  String? code;
  String? expireDate;
  int? maxUseAblity;
  double? discount;
  String? createOn;

  CouponCode({
    this.id,
    this.code,
    this.expireDate,
    this.maxUseAblity,
    this.discount,
    this.createOn,
  });

  CouponCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    expireDate = json['expireDate'];
    maxUseAblity = json['maxUseAblity'];
    discount = json['discount'];
    createOn = json['createOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['code'] = this.code;
    data['expireDate'] = this.expireDate;
    data['maxUseAblity'] = this.maxUseAblity;
    data['discount'] = this.discount;
    data['createOn'] = this.createOn;

    return data;
  }
}
