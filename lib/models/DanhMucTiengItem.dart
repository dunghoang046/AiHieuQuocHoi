// ignore: file_names
class DanhMucTiengItem {
  String? moTa;
  int? thuTu;
  String? ten;
  int? id;
  String? urlAudio;
  DanhMucTiengItem({
    this.id,
    this.moTa,
    this.ten,
    this.thuTu,
    this.urlAudio,
  });

  DanhMucTiengItem.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    moTa = map['MoTa'];
    ten = map['Ten'];
    thuTu = map['ThuTu'];
    urlAudio = map['UrlAudio'];
  }

  factory DanhMucTiengItem.fromJson(Map<String, dynamic> json) {
    return DanhMucTiengItem(
      id: json['id'],
      ten: json['Ten'],
      thuTu: json['ThuTu'],
      moTa: json['MoTa'],
      urlAudio: json['UrlAudio'],
    );
  }
}
