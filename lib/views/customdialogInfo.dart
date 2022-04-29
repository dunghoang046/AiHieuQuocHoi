import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:flutter/material.dart';

class CustomDialogBoxInfo extends StatefulWidget {
  // final String title, descriptions, text;
  // final Image img;

  // const CustomDialogBoxInfo(
  //     {Key key, this.title, this.descriptions, this.text, this.img})
  //     : super(key: key);

  @override
  _CustomDialogBoxStateInfo createState() => _CustomDialogBoxStateInfo();
}

class _CustomDialogBoxStateInfo extends State<CustomDialogBoxInfo> {
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
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xffFCCB17),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text(
                  'THÔNG TIN TÀI KHOẢN',
                  style: TextStyle(
                      color: Color(0xffBB0303),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text('Họ và tên:'),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 25),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                nguoidungsession!.tenhienthi!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Số điện thoại:'),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 15),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                nguoidungsession!.dienthoai!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Email:'),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 15),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                nguoidungsession!.email!.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Tổng điểm:'),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin:const EdgeInsets.only(top: 15),
                            child: Padding(
                              padding:const EdgeInsets.only(right: 0),
                              child: Text(
                                nguoidungsession!.tongDiemSoChoi!.toString(),
                                style:const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                     const Text('Tổng điểm truy cập hàng ngày:'),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 15),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                    nguoidungsession!.tongDiemTruyCap!.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Tổng điểm xem quảng cáo:'),
                      Expanded(
                        child: Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 15),
                            child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                nguoidungsession!.tongDiemQuangCao!.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Stack(
                      children: [
                        Center(
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
                            child: Padding(
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
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/icon_info.png")),
          ),
        ),
      ],
    ));
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
