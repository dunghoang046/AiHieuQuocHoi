class CauTraLoiItem {
  int? id;
  String? moTa;
  int? thuTu;
  String? ten;
  String? urlsourceAudio;
  int? cauHoiId;
  bool? isDung;
  bool? sudung;
  bool? isNamMuoi;
  bool? isMayMan;
  bool? isNguoiThan;
  CauTraLoiItem(
      {this.id,
      this.moTa,
      this.ten,
      this.thuTu,
      this.urlsourceAudio,
      this.cauHoiId,
      this.isNamMuoi,
      this.isMayMan,
      this.isNguoiThan,
      this.isDung,
      this.sudung});
  CauTraLoiItem.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    isNamMuoi = map['IsNamMuoi'];
    isMayMan = map['IsMayMan'];
    isNguoiThan = map['isNguoiThan'];
    moTa = map['MoTa'];
    ten = map['Ten'];
    thuTu = map['ThuTu'];
    cauHoiId = map['CauHoiID'];
    urlsourceAudio = map['urlsourceAudio'];
    isDung = map['IsDung'];
    sudung = false;
  }
  factory CauTraLoiItem.fromJson(Map<String, dynamic> json) {
    return CauTraLoiItem(
        id: json['ID'],
        ten: json['Ten'],
        thuTu: json['ThuTu'],
        moTa: json['MoTa'],
        urlsourceAudio: json['urlsourceAudio'],
        cauHoiId: json['CauHoiID'],
        isNamMuoi: json['IsNamMuoi'],
        isMayMan: json['IsMayMan'],
        isNguoiThan: json['IsNguoiThan'],
        isDung: json['IsDung']);
  }
}
