import 'package:app_aihieuquochoi/models/NguoiDungItem.dart';
import 'package:app_aihieuquochoi/services/nguoiDung_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DSNguoiDungTopController extends GetxController {
  NguoiDung_Service nguoiDung_Service = new NguoiDung_Service();
  List<NguoiDungItem>? _Lstobj = <NguoiDungItem>[];
  List<NguoiDungItem>? get Lstobj => _Lstobj;

  String Loai = "1";
  getNguoiDungTop() async {
    try {
      openAndCloseLoadingDialog();
      _Lstobj = await nguoiDung_Service.getNguoiDungTop(Loai);
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
    if (Get.arguments != null) {
      Loai = Get.arguments['Loai'];
    }
    getNguoiDungTop();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
