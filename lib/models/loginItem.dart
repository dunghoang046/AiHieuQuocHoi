class LoginItem {
  String? userName;
  String? password;
  String? checkFingerprint;
  String? lang;
  int? donviid;
  String? SoDienThoai;
  String? SoDienThoaiNguoiMoi;
  String? tenhienthi;
  String? email;
  LoginItem(
      {this.userName,
      this.tenhienthi,
      this.email,
      this.password,
      this.lang,
      this.checkFingerprint,
      this.SoDienThoai,
      this.SoDienThoaiNguoiMoi,
      this.donviid});
  LoginItem.fromMap(Map<String, dynamic> map) {
    tenhienthi = map['tenhienthi'];
    email = map['Email'];
    userName = map['userName'];
    SoDienThoai = map['SoDienThoai'];
    SoDienThoaiNguoiMoi = map['SoDienThoaiNguoiMoi'];
    donviid = map['DonViID'];
    checkFingerprint = map['checkFingerprint'];
    lang = map['lang'];
  }

  factory LoginItem.fromJson(Map<String, dynamic> json) {
    return LoginItem(
      userName: json['userName'],
      tenhienthi: json['TenHienThi'],
      email: json['Email'],
      password: json['password'],
      SoDienThoai: json['SoDienThoai'],
      SoDienThoaiNguoiMoi: json['SoDienThoaiNguoiMoi'],
      checkFingerprint: json['checkFingerprint'],
      lang: json['lang'],
    );
  }
}
