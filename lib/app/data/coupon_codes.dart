import 'package:invoice/app/models/coupon_code.dart';

class CouponData {
  static List<CouponCode> couponList = [
    CouponCode(
      id: 1,
      code: 'NEWYEAR22',
      discount: 22,
      expireDate: '2021-11-30T24:12:13:000',
      maxUseAblity: 1,
      createOn: '2021-11-24T24:12:13:000',
    ),
    CouponCode(
      id: 2,
      code: 'WELCOME40',
      discount: 40,
      expireDate: '2021-11-30T24:12:13:000',
      maxUseAblity: 1,
      createOn: '2021-11-24T24:12:13:000',
    ),
  ];
}
