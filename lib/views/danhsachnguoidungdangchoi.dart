import 'package:app_aihieuquochoi/controllers/DSNguoiDung_controller.dart';
import 'package:app_aihieuquochoi/views/quiz/components/NguoiDung_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_router/simple_router.dart';

class MyDanhSachNguoiDungDangChoi extends StatefulWidget {
  final String title;

  const MyDanhSachNguoiDungDangChoi({Key? key,required this.title}) : super(key: key);
  @override
  _MyDanhSachNguoiDungDangChoi createState() => _MyDanhSachNguoiDungDangChoi();
}

class _MyDanhSachNguoiDungDangChoi extends State<MyDanhSachNguoiDungDangChoi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                constraints: const BoxConstraints.expand(),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover),
                ),
                child: Stack(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        padding:const EdgeInsets.only(left: 0),
                        onPressed: () {
                          SimpleRouter.back();
                        },
                        child: Container(
                            child: const Image(
                                height: 20,
                                image: AssetImage('assets/images/back.png'))),
                      ),
                       Text(
                        widget.title,
                        style:const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  GetBuilder<DSNguoiDungTopController>(
                      init: DSNguoiDungTopController(),
                      builder: (controller) => Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffAA000D),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.elliptical(20, 30),
                              )),
                          margin: const EdgeInsets.only(top: 50),
                          child:  NguoiDungCard(LstNguoidung: controller.Lstobj)))
                ]))));
  }
}
