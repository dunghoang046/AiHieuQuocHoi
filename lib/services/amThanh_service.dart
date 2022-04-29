import 'package:app_aihieuquochoi/models/CauHoiItem.dart';
import 'package:app_aihieuquochoi/models/DanhMucTiengItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';

class AmThanh_Service{
    Base_service base_service = new Base_service();
    Future<List<DanhMucTiengItem>> getAmThanhByLoai(int Loai) async {
    try {
      var url = "/amthanh/getAmThanhByLoai";
      var data = {
      "Loai": Loai.toString(),
    };
      List<dynamic> vbData = await base_service.getbase(data, url);
      var lst = vbData.map((f) => DanhMucTiengItem.fromMap(f)).toList();
      return lst;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

}