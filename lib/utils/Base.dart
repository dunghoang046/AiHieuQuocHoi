import 'package:app_aihieuquochoi/models/NguoiDungItem.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool islogin = false;
bool ischeckurl = true;
String keyword = '';
String tokenview = '';
String basemessage = '';
  bool? checkAmThanh = false;
  bool? checkNhacNen = false;
  bool? checkDocCauHoi = false;
    bool? checkFingerPrint= false;
// dynamic lstfile;
int tabIndex = 0;
bool isautologin = true;
NguoiDungItem nguoidungsessionView = new NguoiDungItem();
SharedPreferences? sharedPreferences;
checkinternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
 Future<void> openAndCloseLoadingDialog() async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ),
        ),
      ),
    );
  }
Future<void> loadding() async {
  await EasyLoading.show(
    status: 'Đang xử lý...',
    // maskType: EasyLoadingMaskType.custom,
  );
}

Future<void> dismiss() async {
  await EasyLoading.dismiss();
}
