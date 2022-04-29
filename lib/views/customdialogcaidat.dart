import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDialogBoxCaiDat extends StatefulWidget {
  // final String title, descriptions, text;
  // final Image img;

  // const CustomDialogBoxInfo(
  //     {Key key, this.title, this.descriptions, this.text, this.img})
  //     : super(key: key);

  @override
  _CustomDialogBoxCaiDat createState() => _CustomDialogBoxCaiDat();
}

class _CustomDialogBoxCaiDat extends State<CustomDialogBoxCaiDat> {
  final _controller_amthanh = AdvancedSwitchController();
  final _controller_nhacnen = AdvancedSwitchController();
  final _controller_doccauhoi = AdvancedSwitchController();
    final _controller_fingerprint = AdvancedSwitchController();

  @override
  void initState() {
    super.initState();
    getsharedPreferences();
    _controller_amthanh.addListener(() {
      setState(() {
        if (_controller_amthanh.value) {
          checkAmThanh = true;
        } else {
          checkAmThanh = false;
        }

        sharedPreferences!.setString("checkAmThanh", checkAmThanh.toString());
      });
    });
    _controller_nhacnen.addListener(() {
      if (_controller_nhacnen.value) {
        checkNhacNen = true;
      } else {
        checkNhacNen = false;
      }
      sharedPreferences!.setString("checkNhacNen", checkNhacNen.toString());
    });
    _controller_doccauhoi.addListener(() {
      if (_controller_doccauhoi.value) {
        checkDocCauHoi = true;
      } else {
        checkDocCauHoi = false;
      }
      sharedPreferences!.setString("checkDocCauHoi", checkDocCauHoi.toString());
    });
    _controller_fingerprint.addListener(() {
      if (_controller_fingerprint.value) {
        checkFingerPrint = true;
      } else {
        checkFingerPrint = false;
      }
      sharedPreferences!.setString("checkFingerPrint", checkFingerPrint.toString());
    });
  }

  Future<void> getsharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences != null) {
      if (sharedPreferences!.getString("checkAmThanh") != null) {
        checkAmThanh =
            sharedPreferences!.getString("checkAmThanh")!.toLowerCase() ==
                'true';
        _controller_amthanh.value = checkAmThanh!;
      }
      if (sharedPreferences!.getString("checkNhacNen") != null) {
        checkNhacNen =
            sharedPreferences!.getString("checkNhacNen")!.toLowerCase() ==
                'true';
        _controller_nhacnen.value = checkNhacNen!;
      }
      if (sharedPreferences!.getString("checkDocCauHoi") != null) {
        checkDocCauHoi =
            sharedPreferences!.getString("checkDocCauHoi")!.toLowerCase() ==
                'true';
        _controller_doccauhoi.value = checkDocCauHoi!;
      }
       if (sharedPreferences!.getString("checkFingerPrint") != null) {
        checkFingerPrint =
            sharedPreferences!.getString("checkFingerPrint")!.toLowerCase() ==
                'true';
        _controller_fingerprint.value = checkFingerPrint!;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller_amthanh.dispose();
    _controller_doccauhoi.dispose();
    _controller_nhacnen.dispose();
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
              color: const Color(0xffFCCB17),
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
                    'CÀI ĐẶT',
                    style: TextStyle(
                        color: Color(0xffBB0303),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image(
                              width: 20,
                              image: AssetImage('assets/images/volume.png')),
                        ),
                        const Text('Âm thanh:'),
                        Expanded(
                          child: Container(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(),
                                child: AdvancedSwitch(
                                  controller: _controller_amthanh,
                                  activeColor: Color(0xff2477D9),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image(
                              width: 20,
                              image: AssetImage('assets/images/musical.png')),
                        ),
                        const Text('Nhạc nền:'),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(),
                              child: AdvancedSwitch(
                                controller: _controller_nhacnen,
                                activeColor: Color(0xff2477D9),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image(
                              width: 18,
                              image: AssetImage('assets/images/mic.png')),
                        ),
                        const Text('Đọc câu hỏi:'),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:const EdgeInsets.only(),
                              child: AdvancedSwitch(
                                controller: _controller_doccauhoi,
                                activeColor:const Color(0xff2477D9),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                   Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child:Icon(Icons.fingerprint)),
                        const Text('Đăng nhập vân tay:'),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:const EdgeInsets.only(),
                              child: AdvancedSwitch(
                                controller: _controller_fingerprint,
                                activeColor:const Color(0xff2477D9),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                child: Image.asset("assets/images/setting.png")),
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
