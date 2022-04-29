

import 'package:app_aihieuquochoi/models/CauHoiItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';

class CauHoi_Service{
    Base_service base_service = new Base_service();
    Future<List<CauHoiItem>> getAllCauHoi() async {
    try {
     var url = "/cauhoi/GetAllCauHoi";
      List<dynamic> vbData = await base_service.getbase(null, url);
      var lst = vbData.map((f) => CauHoiItem.fromMap(f)).toList();
      return lst;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

}