import 'package:app_aihieuquochoi/models/BaiVietItem.dart';
import 'package:app_aihieuquochoi/services/baiviet_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaiVietController extends GetxController {
  BaiViet_Service baiViet_Service = new BaiViet_Service();
  BaiVietItem obj = BaiVietItem(moTa: '', ten: '');
  getBaiVietHuongDan(int Loai) async {
    try {
      openAndCloseLoadingDialog();
      obj = await baiViet_Service.getBaiVietHuongDan(Loai);
      update();
    } catch (e) {
      Get.snackbar(
          "Thông báo", "Hệ thống đang có lỗi vui lòng quay lại vào lúc khác");
    }
    Navigator.of(Get.overlayContext!).pop();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getBaiVietHuongDan(1);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
