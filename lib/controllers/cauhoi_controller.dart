// ignore_for_file: unnecessary_new

import 'package:app_aihieuquochoi/models/CauHoiItem.dart';
import 'package:app_aihieuquochoi/models/CauTraLoiItem.dart';
import 'package:app_aihieuquochoi/models/DanhMucTiengItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:app_aihieuquochoi/services/amThanh_service.dart';
import 'package:app_aihieuquochoi/services/cauhoi_service.dart';
import 'package:app_aihieuquochoi/services/nguoiDung_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:app_aihieuquochoi/views/quiz/components/dialogGiaiThich.dart';
import 'package:app_aihieuquochoi/views/quiz/components/dialogTroGiup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:app_aihieuquochoi/views/score/KetThuc_screen.dart';
import 'package:just_audio/just_audio.dart';

// We use get package for our state management

class CauHoiController extends GetxController
    // ignore: deprecated_member_use
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  // Lets animated our progress bar
  CauHoi_Service cauHoi_Service = new CauHoi_Service();
  AmThanh_Service amThanh_Service = new AmThanh_Service();
  NguoiDung_Service nguoiDung_Service = new NguoiDung_Service();
  AnimationController? _animationController;
  Animation? _animation;
  // so that we can access our animation outside
  Animation? get animation => this._animation;
  List<CauHoiItem> _questions = <CauHoiItem>[];
  PageController? _pageController;

  PageController? get pageController => this._pageController;
  List<CauTraLoiItem> _cauTraLois = <CauTraLoiItem>[];
  List<CauHoiItem> get questions => this._questions;
  List<CauTraLoiItem> get cauTraLois => this.cauTraLois;
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _correctAns;
  int? get correctAns => this._correctAns;

  int? _selectedAns;
  int? get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _soCauTraLoiDung = 0;
  int get soCauTraLoiDung => _soCauTraLoiDung;

  int _tongDiem = 0;
  int get tongDiem => _tongDiem;

  String? _audioChinhXac;
  String? get audioChinhXac => _audioChinhXac;

  int? _soLanTroGiup;
  int? get soLanTroGiup => _soLanTroGiup;

  String? _txtoption = "Bỏ qua";
  String? get txtoption => _txtoption;

  List<DanhMucTiengItem> _lstdanhmuctieng = <DanhMucTiengItem>[];
  List<DanhMucTiengItem> get lstdanhmuctieng => _lstdanhmuctieng;
  CauHoiItem _questionNow = CauHoiItem(moTa: '');
  CauHoiItem get questionNow => _questionNow;
  List<DanhMucTiengItem> lstAmThanhTroGiup = <DanhMucTiengItem>[];
  bool? _isTiepTuc;
  bool? get isTiepTuc => _isTiepTuc;
  bool? _isGiaiThich;
  bool? get isGiaiThich => _isGiaiThich;
  bool isreadcomplate = false;
  @override
  void onInit() {
    _isTiepTuc = true;
    getalldulieuNhacNen(6);
    if (sharedPreferences!.getString("checkDocCauHoi") != null) {
      checkDocCauHoi =
          sharedPreferences!.getString("checkDocCauHoi")!.toLowerCase() ==
              'true';
    }
    getalldulieu();
    _soLanTroGiup = 0;
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        // update like setState
        update();
      });
    _animationController?.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  void getalldulieu() async {
    _questions = await cauHoi_Service.getAllCauHoi();
    if (_questions.isNotEmpty && _questions.length > 0) {
      _audioChinhXac = _questions[0].urlaudiochinhxac;
      update();
    }
  }

  AudioPlayer? _playercauhoi;
  AudioPlayer? _playercautraloi;
  AudioPlayer? _playerDapAnDung;
  AudioPlayer? _playerNhacNen;
  AudioPlayer? _playerTroGiup;
  Future<void> initNhacNen(DanhMucTiengItem amThanh) async {
    _playerNhacNen = new AudioPlayer();
    try {
      var urlsource = urlsourcedomain + amThanh.urlAudio!;
      await _playerNhacNen!.setUrl(urlsource);
      await _playerNhacNen?.play();
      update();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading audio source: $e");
    }
  }

  Future<void> initTroGiup(DanhMucTiengItem amThanh) async {
    _playerTroGiup = new AudioPlayer();
    try {
      var urlsource = urlsourcedomain + amThanh.urlAudio!;
      await _playerTroGiup!.setUrl(urlsource);
      await _playerTroGiup?.play();
      update();
    } catch (e) {
      // ignore: avoid_print
      print("Error loading audio source: $e");
    }
  }

  void getalldulieuNhacNen(int Loai) async {
    _lstdanhmuctieng = await amThanh_Service.getAmThanhByLoai(Loai);
  }

  Future<void> initcauhoi(CauHoiItem question) async {
    if (checkDocCauHoi == true) {
      try {
        _playercauhoi = new AudioPlayer();
        var urlsource = urlsourcedomain + question.urlsourceAudio!;
        await _playercauhoi!.setUrl(urlsource);
        _playercauhoi?.play();
        _playercauhoi?.playerStateStream.listen((state) async {
          if (state.processingState == ProcessingState.completed) {
            _playercautraloi = new AudioPlayer();
            await _playercautraloi!.setAudioSource(
              ConcatenatingAudioSource(
                useLazyPreparation: true, // default
                shuffleOrder: DefaultShuffleOrder(), // default
                children: [
                  for (var i = 0; i < question.lstCauTraLoiItem!.length; i++)
                    if (question.lstCauTraLoiItem![i].urlsourceAudio != null &&
                        question
                            .lstCauTraLoiItem![i].urlsourceAudio!.isNotEmpty)
                      AudioSource.uri(Uri.parse(urlsourcedomain +
                          question.lstCauTraLoiItem![i].urlsourceAudio
                              .toString())),
                ],
              ),
              initialIndex: 0, // default
              initialPosition: Duration.zero,
            );
            if (question.lstCauTraLoiItem
                    ?.where((element) => element.urlsourceAudio != null) !=
                null) {
              await _playercautraloi?.play();
              _playercautraloi?.playerStateStream.listen((state) async {
                if (state.processingState == ProcessingState.completed) {
                  isreadcomplate = true;
                }
              });
            }
          }
        });
      } catch (e) {
        print("Error loading audio source: $e");
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    _animationController?.dispose();
    _pageController?.dispose();
    _playercauhoi?.dispose();
    _playercautraloi?.dispose();
    _playerDapAnDung?.dispose();
    _playerNhacNen?.dispose();
    _playerTroGiup?.dispose();
  }

  Future<void> checkCauTLDung(CauHoiItem question, int selectedIndex) async {
    _isAnswered = true;
    _isTiepTuc = true;
    _txtoption = "Bỏ qua";
    _questionNow = question;
    var questionisDung = question.lstCauTraLoiItem!
        .where((x) => x.isDung != null && x.isDung == true);
    _correctAns = 0;
    // ignore: unnecessary_null_comparison
    if (questionisDung != null) {
      _correctAns = questionisDung.first.thuTu! - 1;
    }

    _selectedAns = selectedIndex;
    _playercauhoi?.playerStateStream.listen((state) async {
      if (state.processingState != ProcessingState.completed) {
        await _playercauhoi?.dispose();
      }
    });
    _playercautraloi?.playerStateStream.listen((state) async {
      if (state.processingState != ProcessingState.completed) {
        await _playercautraloi?.dispose();
      }
    });
    _playerNhacNen?.playerStateStream.listen((state) async {
      if (state.processingState != ProcessingState.completed) {
        await _playerNhacNen?.dispose();
      }
    });

    if (question.urlAudioDapAn!.isNotEmpty) {
      _playerDapAnDung = new AudioPlayer();
      if (_correctAns == selectedIndex) {
        question.urlAudioDapAn = audioChinhXac;
      }
      await _playerDapAnDung?.setUrl(urlsourcedomain + question.urlAudioDapAn!);
      _playerDapAnDung?.play();
    }
    if (_correctAns == _selectedAns) {
      _soCauTraLoiDung++;
      _tongDiem=(_soCauTraLoiDung*5);
    }
    _isTiepTuc = false;
    _txtoption = "Giải thích";
    _isGiaiThich = false;
    // It will stop the counter
    _animationController?.stop();
    update();
    Future.delayed(const Duration(seconds: 3), () {
      if (isTiepTuc == true || (isTiepTuc == false && isGiaiThich == false))
        // ignore: curly_braces_in_flow_control_structures
        nextQuestion();
    });
  }

  void giaiThich() {
    _isGiaiThich = true;
    _isTiepTuc = false;
    Get.dialog(DialogBoxGiaiThich());
  }

  void checkTiepTuc() {
    _isTiepTuc = true;
    _txtoption = "Bỏ qua";
  }

  void getamthanhtrogiup(int Loai) async {
    lstAmThanhTroGiup = <DanhMucTiengItem>[];
    lstAmThanhTroGiup = await amThanh_Service.getAmThanhByLoai(Loai);
  }

  void confirmtrogiup5050(CauHoiItem question, int LoaiTroGiup) async {
    lstAmThanhTroGiup = <DanhMucTiengItem>[];

    lstAmThanhTroGiup = await amThanh_Service.getAmThanhByLoai(LoaiTroGiup);
    if (lstAmThanhTroGiup.length > 0) {
      if (checkDocCauHoi == true) {
        if (isreadcomplate == true) {
          initTroGiup(lstAmThanhTroGiup[0]);
          Get.dialog(
              DialogBoxTroGiup(
                danhMucTiengItem: lstAmThanhTroGiup[0],
                cauHoiItem: question,
                Loai: LoaiTroGiup,
              ),
              barrierDismissible: false);
          _animationController?.stop();
        }
      } else {
        Get.dialog(
            DialogBoxTroGiup(
              danhMucTiengItem: lstAmThanhTroGiup[0],
              cauHoiItem: question,
              Loai: LoaiTroGiup,
            ),
            barrierDismissible: false);
        _animationController?.stop();
      }
    }
    update();
  }

  void approvedtrogiup5050(CauHoiItem question) {
    _soLanTroGiup = _soLanTroGiup! + 1;
    for (var i = 0; i < question.lstCauTraLoiItem!.length; i++) {
      if (question.lstCauTraLoiItem![i].isNamMuoi == true) {
        question.lstCauTraLoiItem![i].ten = '';
      }
    }
    update();
  }

  void approvedtrogiupMayMan(CauHoiItem question) {
    _soLanTroGiup = _soLanTroGiup! + 1;
    for (var i = 0; i < question.lstCauTraLoiItem!.length; i++) {
      if (question.lstCauTraLoiItem![i].isMayMan == true) {
        question.lstCauTraLoiItem![i].ten = '';
      }
    }
     _tongDiem=_tongDiem-2;
    update();
  }

  void approvedtrogiupNguoiThan(CauHoiItem question) {
    _soLanTroGiup = _soLanTroGiup! + 1;
    for (var i = 0; i < question.lstCauTraLoiItem!.length; i++) {
      if (question.lstCauTraLoiItem![i].isNguoiThan == true) {
        question.lstCauTraLoiItem![i].ten = '';
      }
    }
    update();
  }

  // ignore: non_constant_identifier_names
  void start_animationController(
      CauHoiItem cauHoiItem, bool isApproved, int LoaiTroGiup) {
    if (isApproved == true) {
      if (LoaiTroGiup == 7) {
        approvedtrogiup5050(cauHoiItem);
      } else if (LoaiTroGiup == 8) {
        approvedtrogiupMayMan(cauHoiItem);
      } else {
        approvedtrogiupNguoiThan(cauHoiItem);
      }
    }    
    _animationController?.forward();
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });
    _animationController?.forward().whenComplete(nextQuestion);
  }

  void trogiupmayman(CauHoiItem question) {
    _soLanTroGiup = _soLanTroGiup! + 1;
    question.lstCauTraLoiItem =
        question.lstCauTraLoiItem?.where((e) => e.isMayMan != true).toList();
    update();
  }

  void trogiupnguoithan(CauHoiItem question) {
    _soLanTroGiup = _soLanTroGiup! + 1;
    question.lstCauTraLoiItem =
        question.lstCauTraLoiItem?.where((e) => e.isNguoiThan != true).toList();
    update();
  }

  Future<void> nextQuestion() async {
    _txtoption = "Bỏ qua";
    _isTiepTuc = true;
    isreadcomplate = false;
    await _playercauhoi?.dispose();
    await _playercautraloi?.dispose();
    await _playerNhacNen?.dispose();
    await _playerTroGiup?.dispose();
    _animationController?.stop();
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController?.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      // Reset the counter
      _animationController?.reset();
      _animationController?.forward().whenComplete(nextQuestion);
    } else {
      updateDiemSo();
    }
  }

  updateDiemSo() async {
    try {
      openAndCloseLoadingDialog();
      var data = {
        "ID": nguoidungsessionView.nguoiDungChoiGameID,
        "DiemSoChoi": tongDiem,
        "SoCauDung": _soCauTraLoiDung,
        "ThoiGianChoi":0
      };
      await nguoiDung_Service.updateDiemSo(data);
      Get.to(KetThucScreen());
      update();
    } catch (e) {
      Navigator.of(Get.overlayContext!).pop();
      Get.snackbar(
          "Thông báo", "Hệ thống đang có lỗi vui lòng quay lại vào lúc khác");
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
