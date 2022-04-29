
import 'package:app_aihieuquochoi/models/BaiVietItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';

// ignore: camel_case_types
class BaiViet_Service{
    Base_service base_service = new Base_service();
    Future<BaiVietItem> getBaiVietHuongDan(int Loai) async {
    try {
      var data = {
        "Loai": Loai.toString(),
      };
   var url = "/baiviet/getBaiVietHuongDan";
      var vbData = await base_service.getbase(data, url);
     var obj = BaiVietItem.fromMap(vbData);
     return obj;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

}