import 'package:app_aihieuquochoi/block/login_block/Auth_event.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:app_aihieuquochoi/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert' show utf8;

class LoginController extends GetxController {
  final Base_service base_service = new Base_service();
  final AuthEvent? event;
  LoginController({this.event});
  login(AuthEvent event) async {
    try {
      openAndCloseLoadingDialog();
      var data = {
        "userName": event.logindata.userName,
        "password": event.logindata.password,
        "SoDienThoai": event.logindata.SoDienThoai,
        "lang": "vi",
        "checkFingerprint": "true"
      };
      await base_service.getlogin(data).then((result) {
        nguoidungsession = result;
        // ignore: unnecessary_null_comparison
        if (nguoidungsession != null) {
          islogin = true;
          token = nguoidungsession!.token!;
          nguoidungsessionView = nguoidungsession!;
          tokenview = token;
          ischeckurl = true;
          Get.to(MyHome());
        } else {
          Navigator.of(Get.overlayContext!).pop();
          Get.snackbar("Thông báo", "Tài khoản không đúng");
        }
      });
    } catch (e) {}
  }
void GetOTP() {
    const secret_key = "chungnd@123";
    const otp_valid_for_secs = 15;
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int factor = otp_valid_for_secs * 1000;
    int otp_changing_parameter = (timestamp/factor).round();
    var bytes = utf8.encode(otp_changing_parameter.toString() + secret_key);
    Digest hashed_value = sha256.convert(bytes);
    var last_six_characters = hashed_value.toString().substring(hashed_value.toString().length - 6);
    var otp =  int.parse(last_six_characters, radix: 16);
    var otp_string = otp.toString();
    while (otp_string.length < 8)
              {
                  otp_string = "0" + otp_string;
              }
    print(otp_string);
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
