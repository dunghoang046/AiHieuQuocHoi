import 'package:app_aihieuquochoi/Unit/components.dart';
import 'package:app_aihieuquochoi/views/home.dart';
import 'package:app_aihieuquochoi/views/sansang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:app_aihieuquochoi/controllers/cauhoi_controller.dart';

class KetThucScreen extends StatelessWidget {
  const KetThucScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    CauHoiController _qnController = Get.put(CauHoiController());
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  // const Spacer(flex: 1),
                  Center(
                    child: Padding(
                      padding:const EdgeInsets.only(top: 2.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: ScreenUtil().setWidth(210),
                      ),
                    ),
                  ),
                  ButtonContainerHome(
                    text: 'Trang chủ',
                    strimage: 'assets/images/btn_Group.png',
                    mOnPressed: () => {Get.offAll(MyHome())},
                    isselect: false,
                    top: 1,
                    heightimg: 50,
                    topimg: 5,
                  ),
                   ButtonContainerHome(
                    text: 'Chơi lại',
                    strimage: 'assets/images/btn_Group.png',
                    mOnPressed: () => {Get.offAll(MySanSang())},
                    isselect: false,
                    top: 1,
                    heightimg: 50,
                    topimg: 5,
                  ),
                  Container(
                    margin:const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: const Text(
                    "Kết thúc",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),),
                  // const Spacer(),
                  Container(
                     margin:const EdgeInsets.fromLTRB(0, 10, 0, 0),
                   child:  Text(
                    "Bạn đã trả lời đúng ${_qnController.soCauTraLoiDung} câu",
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                 ),
                 Container(
                     margin:const EdgeInsets.fromLTRB(0, 10, 0, 0),
                   child:  Text(
                    "Đạt ${_qnController.tongDiem} điểm",
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                 ),
                 Container(
                     margin:const EdgeInsets.fromLTRB(0, 10, 0, 0),
                   child: const Text(
                    "Xin chúc mừng",
                    style:  TextStyle(fontSize: 20, color: Colors.red,fontWeight:FontWeight.w800),
                  ),
                 ),
                  const Spacer(flex: 3),
                ],
              )
            ],
          )),
    ));
  }
}
