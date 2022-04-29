import 'package:app_aihieuquochoi/block/login_block/Auth_event.dart';
import 'package:app_aihieuquochoi/models/MessageItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DangKyController extends GetxController{
   final Base_service base_service = new Base_service();
  final AuthEvent? event;
  DangKyController({this.event});

dangky (AuthEvent event) async{
  try {
       openAndCloseLoadingDialog();
      var data = {
        "TenHienThi": event.logindata.tenhienthi,
        "DienThoai": event.logindata.SoDienThoai,
        "password": event.logindata.password,
        "Email": event.logindata.email,
        "SoDienThoaiNguoiMoi": event.logindata.SoDienThoaiNguoiMoi
      };
     await  base_service.dangky(data).then((result) {
        MessageItem obj = result;
        // ignore: unnecessary_null_comparison
        if (obj != null) {        
          obj = obj;
           Navigator.of(Get.overlayContext!).pop();
          Get.snackbar("Thông báo", obj.title!);
        } else {
          Navigator.of(Get.overlayContext!).pop();
          Get.snackbar("Thông báo", "Tài khoản không đúng");
        }
      });
    } catch (e) {
     Get.snackbar("Thông báo", "Hệ thống đang có lỗi vui lòng quay lại vào lúc khác");
    }
}
   @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}