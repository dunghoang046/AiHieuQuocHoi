import 'package:app_aihieuquochoi/services/nguoiDung_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoiNguoiThamGiaController extends GetxController {
  final NguoiDung_Service nguoiDung_Service = new NguoiDung_Service();
  Future<bool> addMoiNguoiThamGia(dynamic data) async {
    bool error = false;
    try {
      openAndCloseLoadingDialog();
      var obj = await nguoiDung_Service.addMoiNguoiThamGia(data);
      Get.snackbar("Thông báo", obj.title!);
      error = obj.error!;
    } catch (e) {
      Get.snackbar(
          "Thông báo", "Hệ thống đang có lỗi vui lòng quay lại vào lúc khác");
      error = true;
    }
    Navigator.of(Get.overlayContext!).pop();
    return error;
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
