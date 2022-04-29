import 'package:app_aihieuquochoi/models/MessageItem.dart';
import 'package:app_aihieuquochoi/models/NguoiDungItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';

// ignore: camel_case_types
class NguoiDung_Service {
  Base_service base_service = new Base_service();
  Future<void> updateDiemSo(dynamic data) async {
    try {
      var url = "/nguoiDungChoiGame/updateDiemSo";
      await base_service.post(data, url);
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  Future<List<NguoiDungItem>> getNguoiDungTop(String Loai) async {
    try {
      var data = {
        "Loai": Loai,
      };
      var url = "/nguoiDungChoiGame/getTopNguoiChoi";
      List<dynamic> vbData = await base_service.getbase(data, url);
      var lst = vbData.map((f) => NguoiDungItem.fromMap(f)).toList();
      return lst;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }
  Future<MessageItem> addMoiNguoiThamGia(dynamic data) async {
    try {
      var url = "/nguoiDungChoiGame/addMoiNguoiThamGia";
      var vbData = await base_service.post(data, url);
      var obj = MessageItem.fromMap(vbData);
      return obj;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }
}
