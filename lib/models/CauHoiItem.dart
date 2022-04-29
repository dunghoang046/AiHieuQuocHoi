import 'package:app_aihieuquochoi/models/CauTraLoiItem.dart';

class CauHoiItem {
  String? moTa;
  int? thuTu;
  String? ten;
  String? urlsourceAudio;
  int? id;
  bool? sudung;
  String? urlAudioDapAn;
  String? urlaudiochinhxac;
  List<CauTraLoiItem>? lstCauTraLoiItem;
  CauHoiItem(
      {this.id,
      required this.moTa,
      this.ten,
      this.thuTu,
      this.urlsourceAudio,
      this.urlAudioDapAn,
      this.urlaudiochinhxac,
      this.lstCauTraLoiItem,
      this.sudung});
  CauHoiItem.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    urlAudioDapAn = map['UrlAudioDapAn'];
    urlaudiochinhxac = map['Urlaudiochinhxac'];
    moTa = map['MoTa'];
    ten = map['Ten'];
    thuTu = map['thuTu'];
    sudung = false;
    urlsourceAudio = map['urlsourceAudio'];
    if (map['LstCauTraLoiItem'] != null && map['LstCauTraLoiItem'].length > 0) {
      List<dynamic> vbData = map['LstCauTraLoiItem'];
      lstCauTraLoiItem = vbData.map((f) => CauTraLoiItem.fromMap(f)).toList();
    } else {
      lstCauTraLoiItem = <CauTraLoiItem>[];
    }
  }

  factory CauHoiItem.fromJson(Map<String, dynamic> json) {
    return CauHoiItem(
      id: json['id'],
      urlAudioDapAn: json['UrlAudioDapAn'],
      urlaudiochinhxac: json['Urlaudiochinhxac'],
      ten: json['Ten'],
      thuTu: json['ThuTu'],
      moTa: json['MoTa'],
      sudung: false,
      urlsourceAudio: json['urlsourceAudio'],
    );
  }
}
