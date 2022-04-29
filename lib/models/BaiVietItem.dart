class BaiVietItem {
  String? moTa;
  int? thuTu;
  String? ten;
  int? id;
  BaiVietItem(
      {this.id,
      required this.moTa,
      this.ten,
      this.thuTu,
});
  BaiVietItem.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    moTa = map['MoTa'];
    ten = map['Ten'];
    thuTu = map['thuTu'];
  }

  factory BaiVietItem.fromJson(Map<String, dynamic> json) {
    return BaiVietItem(
      id: json['id'],    
      ten: json['Ten'],
      thuTu: json['ThuTu'],
      moTa: json['MoTa'],
    );
  }
}
