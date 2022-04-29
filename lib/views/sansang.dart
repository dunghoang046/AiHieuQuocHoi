
import 'package:app_aihieuquochoi/Unit/components.dart';
import 'package:app_aihieuquochoi/controllers/sansang_controller.dart';
import 'package:app_aihieuquochoi/views/home.dart';
import 'package:app_aihieuquochoi/views/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MySanSang extends StatefulWidget {
  @override
  _MySanSang createState() => _MySanSang();
}

class _MySanSang extends State<MySanSang> {
  @override
  void initState() {
    super.initState();
  }

  void closeapp(contextdialog) {
    // exit(0);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHome_Les()));
  }

  @override
  Widget build(BuildContext context) {
    SanSangController _controller = Get.put(SanSangController());
    return GetBuilder<SanSangController>(
        init: SanSangController(),
        builder: (controller) => SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Mask.png"),
                      fit: BoxFit.cover),
                ),
                child: ScreenUtilInit(
                    builder: () => KeyboardDismisser(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: ScreenUtil().setHeight(75),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/logo_g.png',
                                  width: ScreenUtil().setWidth(150),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          const Center(
                                            child: Image(
                                                height: 65,
                                                image: AssetImage(
                                                    'assets/images/btn_choigame.png')),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: MaterialButton(
                                              onPressed: () async {
                                                await _controller
                                                    .pauseAmThanh();
                                                Get.to(const QuizScreen());
                                              },
                                              child: const Center(
                                                child: Text(
                                                  'Sẵn sàng',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ButtonContainerHome(
                                        text: 'Trang chủ',
                                        strimage: 'assets/images/btn_Group.png',
                                        mOnPressed: () => {
                                          _controller.disposeAmThanh(),
                                          Get.offAll(MyHome())
                                        },
                                        isselect: false,
                                        top: 1,
                                        heightimg: 50,
                                        topimg: 5,
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: ScreenUtil().setHeight(75),
                              ),
                            ],
                          ),
                        ))))));
  }
}
