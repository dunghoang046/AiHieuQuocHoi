import 'package:app_aihieuquochoi/Unit/components.dart';
import 'package:app_aihieuquochoi/block/base/event.dart';
import 'package:app_aihieuquochoi/main.dart';
import 'package:app_aihieuquochoi/views/bangxephang.dart';
import 'package:app_aihieuquochoi/views/customdialogInfo.dart';
import 'package:app_aihieuquochoi/views/customdialogcaidat.dart';
import 'package:app_aihieuquochoi/views/customdialogmoinguoichoi.dart';
import 'package:app_aihieuquochoi/views/danhsachnguoidungdangchoi.dart';
import 'package:app_aihieuquochoi/views/huongdandialog.dart';
import 'package:app_aihieuquochoi/views/sansang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:simple_router/simple_router.dart';

class MyHome_Les extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHome createState() => _MyHome();
}

int indexda = 0;
final _formKey = GlobalKey<FormState>();

class _MyHome extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
        ),
        child: ScreenUtilInit(
            builder: () => KeyboardDismisser(
                    child: Stack(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: ScreenUtil().setWidth(190),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 150, left: 50, right: 50),
                        child: Form(
                            child: Column(
                          children: [
                            _onLoginClick(
                                'Chơi Game', 'assets/images/btn_Group.png', 1),
                            _onLoginClick('Thông tin tài khoản',
                                'assets/images/btn_Group.png', 2),
                            _onLoginClick('Hướng dẫn người chơi',
                                'assets/images/btn_Group.png', 3),
                            _onLoginClick(
                                'Cài đặt', 'assets/images/btn_Group.png', 4),
                            _onLoginClick('Mời người dùng tham gia',
                                'assets/images/btn_Group.png', 5),
                            _onLoginClick('Bảng xếp hạng',
                                'assets/images/btn_Group.png', 6),
                            _ondangxuatClick('Đăng xuất',
                                'assets/images/btn_choigame.png', 7),
                          ],
                        )),
                      ),
                    )
                  ],
                ))),
      ),
    ));
  }

  _click(int index, textcontent) async {    
    setState(() {
      indexda = index;
    });
    if (index == 1) {
      // SimpleRouter.forward(MySanSang());
      Get.to(MySanSang());
    }
    if (index == 2) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBoxInfo();
          });
    }
    if (index == 3) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBoxHuongDan();
          });
    }
    if (index == 4) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBoxCaiDat();
          });
    }
    if (index == 5) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBoxMoiNguoiThamGia();
          });
    }
    if (index == 6) {
      SimpleRouter.forward(MyBangXepHang());
      // Get.to(MyBangXepHang());
    }
  }

  Widget _onLoginClick(String text, String strimage, int index) {
    return ButtonContainerHome(
      text: text,
      strimage: strimage,
      mOnPressed: () => {_click(index, text)},
      isselect: false,
      top: 1,
      heightimg: 50,
      topimg: 5,
    );
  }
  Widget _ondangxuatClick(String text, String strimage, int index) {
    return ButtonContainerHome(
      text: text,
      strimage: strimage,
      mOnPressed: () => { Get.offAll(const MyHomePage())},
      isselect: true,
      top: 1,
      heightimg: 65,
      topimg: 5,
    );
  }
}
