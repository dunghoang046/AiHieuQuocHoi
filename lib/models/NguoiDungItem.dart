class NguoiDungItem {
  int? id;
  String? tenhienthi;
  String? tentruycap;
  String? matkhau;
  int? thutu;
  String? ngaysinh;
  String? gioitinh;
  String? email;
  String? diachi;
  String? dienthoai;
  String? didong;
  String? anhdaidien;
  int? chucvuid;
  int? vitriid;
  String? tenchucvu;
  String? tendonvi;
  int? donviid;
  int? donvichaid;
  bool? islanhdao;
  bool? islargest;
  String? tenchucvuhienthi;
  String? tenviettatdonvi;
  String? tenviettatphongban;
  List<dynamic>? ltsphongbanid;
  String? quyenhan;
  String? token;
  String? linkanh;
  String? tennhomnguoidung;
  String? strNguoiDungDonVi;
  int? tongDiemSoChoi;
  int?tongDiemTruyCap;
  int?tongDiemQuangCao;
  int?nguoiDungChoiGameID;
  int?diemCaoNhat;
  NguoiDungItem({
    this.id,
    this.tenhienthi,
    this.thutu,
    this.ngaysinh,
    this.gioitinh,
    this.email,
    this.diachi,
    this.dienthoai,
    this.didong,
    this.anhdaidien,
    this.chucvuid,
    this.vitriid,
    this.tenchucvu,
    this.tendonvi,
    this.donviid,
    this.donvichaid,
    this.islanhdao,
    this.islargest,
    this.tenchucvuhienthi,
    this.tenviettatdonvi,
    this.tenviettatphongban,
    this.ltsphongbanid,
    this.quyenhan,
    this.tentruycap,
    this.matkhau,
    this.token,
    this.linkanh,
    this.tennhomnguoidung,
    this.strNguoiDungDonVi,
    this.tongDiemSoChoi,
    this.tongDiemQuangCao,
    this.tongDiemTruyCap,
    this.diemCaoNhat,
    this.nguoiDungChoiGameID,
  });
  NguoiDungItem.fromMap(Map<String, dynamic> map) {
    id = map['ID'];
    tenhienthi = map['TenHienThi'];
    thutu = map['ThuTu'];
    // ngaysinh = map['NgaySinh'];
    token = map['Token'];
    tentruycap = map['TenTruyCap'];
    donviid = map['DonViID'];
    donvichaid = map['DonViChaID'];
    quyenhan = map['QuyenHan'];
    tendonvi = map['TenDonVi'];
    ltsphongbanid = map['LtsPhongBanID'];
    islanhdao = map['IsLanhDao'];
    vitriid = map['ViTriID'];
    email = map['Email'];
    tenchucvu = map['TenChucVu'];
    linkanh = map['LinkAnh'];
    dienthoai = map['DienThoai'];
    tennhomnguoidung = map['TenNhomNguoiDung'];
    didong = map['DiDong'];
    anhdaidien = map['AnhDaiDien'];
    tongDiemSoChoi= map['TongDiemSoChoi'];
    tongDiemTruyCap= map['TongDiemTruyCap'];
    tongDiemQuangCao= map['TongDiemQuangCao'];
    nguoiDungChoiGameID=map['NguoiDungChoiGameID'];
    diemCaoNhat = map['DiemCaoNhat'];
    if (map['strNguoiDungDonVi'] != null) {
      strNguoiDungDonVi = map['strNguoiDungDonVi'];
    }

    if (map['IsLargest'] != null) {
      islargest = map['IsLargest'];
    } else {
      islargest = false;
    }
  }
}
