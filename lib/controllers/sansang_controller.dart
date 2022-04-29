import 'package:app_aihieuquochoi/models/DanhMucTiengItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:app_aihieuquochoi/services/amThanh_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SanSangController extends GetxController {
  final AmThanh_Service amThanh_Service =  AmThanh_Service();
  List<DanhMucTiengItem> lstdanhmuctieng = <DanhMucTiengItem>[];
  void getalldulieu(int Loai) async {
    lstdanhmuctieng =await amThanh_Service.getAmThanhByLoai(Loai);
    if (lstdanhmuctieng.isNotEmpty) {
      if (sharedPreferences!.getString("checkAmThanh") != null) {
        checkAmThanh =
            sharedPreferences!.getString("checkAmThanh")!.toLowerCase() ==
                'true';
        if (checkAmThanh == true) {
          initAmThanh(lstdanhmuctieng[0]);
        }
      }
    }
  }
  int indexda = 0;
  AudioPlayer? _player;
  Future<void> initAmThanh(DanhMucTiengItem amThanh) async {
    // ignore: unnecessary_new
    _player = new AudioPlayer();
    try {
      var urlsource = urlsourcedomain + amThanh.urlAudio!;
      await _player!.setUrl(urlsource);
      await _player?.play();

      update();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }
  Future<void> pauseAmThanh() async {
    await _player?.dispose();
    update();
  }

  void disposeAmThanh() {
    _player?.dispose();
  }

  @override
  void onInit() {    
    super.onInit();
  }

  @override
  void onReady() {
    getalldulieu(5);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // _player?.dispose();
  }
}
