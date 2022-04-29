import 'package:app_aihieuquochoi/controllers/moinguoithamgia_controller.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';

class CustomDialogBoxMoiNguoiThamGia extends StatefulWidget {
  // final String title, descriptions, text;
  // final Image img;

  // const CustomDialogBoxInfo(
  //     {Key key, this.title, this.descriptions, this.text, this.img})
  //     : super(key: key);

  @override
  _CustomDialogBoxMoiNguoiThamGia createState() =>
      _CustomDialogBoxMoiNguoiThamGia();
}

final _formKey = GlobalKey<FormState>();
TextEditingController? txtsdt;
TextEditingController? txtemail;

class _CustomDialogBoxMoiNguoiThamGia
    extends State<CustomDialogBoxMoiNguoiThamGia> {
  void initState() {
    txtsdt = TextEditingController();
    txtemail = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txtsdt?.dispose();
    txtemail?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0XffFCCB17),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Center(
                  child: Text(
                    'MỜI NGƯỜI THAM GIA',
                    style: TextStyle(
                        color: Color(0xffBB0303),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Stack(
                                children: [
                                  const Image(
                                      image:
                                          AssetImage('assets/images/Path.png')),
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: txtsdt,
                                    decoration: const InputDecoration(
                                      hintText: "Số điện thoại",
                                      alignLabelWithHint: true,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 14.0),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Vui lòng nhập số điện thoại';
                                      }
                                    },
                                  ),
                                ],
                              )),
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Stack(
                                children: [
                                  const Image(
                                      image:
                                          AssetImage('assets/images/Path.png')),
                                  TextFormField(
                                    textAlign: TextAlign.center,
                                    controller: txtemail,
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      alignLabelWithHint: true,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 14.0),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Vui lòng nhập email';
                                      }
                                    },
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Stack(
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'assets/images/btn_dangky.png')),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: MaterialButton(
                                      onPressed: () {
                                        addmoithamgia();
                                      },
                                      child: const Center(
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      )),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Stack(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage('assets/images/close.png'),
                            width: 110,
                          ),
                        ),
                        Center(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(),
                              child: Text(
                                'Đóng',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/moi_ban.png")),
          ),
        ),
      ],
    ));
  }
}

MoiNguoiThamGiaController _controller = MoiNguoiThamGiaController();
void addmoithamgia() async {
  var checkinter = await checkinternet();
  if (!checkinter) {
  } else if (_formKey.currentState!.validate()) {
    var data = {
      "NguoiMoiID": nguoidungsession?.id!.toString(),
      "SoDienThoai": txtsdt!.text,
      "Email": txtemail!.text,
      "SoDienThoaiNguoiMoi": nguoidungsession!.dienthoai!
    };
    var error = await _controller.addMoiNguoiThamGia(data);
    if (error != true) {
      txtsdt!.text = '';
      txtemail!.text = '';
    }
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
