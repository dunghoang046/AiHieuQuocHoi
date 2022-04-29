import 'package:app_aihieuquochoi/views/danhsachnguoidungdangchoi.dart';
import 'package:app_aihieuquochoi/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:simple_router/simple_router.dart';

class MyBangXepHang extends StatefulWidget {
  @override
  _MyBangXepHang createState() => _MyBangXepHang();
}

class _MyBangXepHang extends State<MyBangXepHang> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: SafeArea(
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
                            padding: const EdgeInsets.only(left: 0),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => MyHome_Les()));
                              SimpleRouter.back();
                            },
                            child: Container(
                                child: const Image(
                                    height: 20,
                                    image:
                                        AssetImage('assets/images/back.png'))),
                          ),
                          const Text(
                            'BẢNG XẾP HẠNG',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 35),
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Container(
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/Group_db.png')),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () => {
                                          Get.to(
                                              const MyDanhSachNguoiDungDangChoi(
                                                  title:
                                                      'TOP NGƯỜI CHƠI TRONG TUẦN'),
                                              arguments: {"Loai": "3"})
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(24),
                                          child: Text(
                                            'Top tuần',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/Group_db.png')),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () => {
                                          Get.to(
                                              MyDanhSachNguoiDungDangChoi(
                                                  title:
                                                      'TOP NGƯỜI CHƠI TRONG THÁNG'),
                                              arguments: {"Loai": "2"})
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(24),
                                          child: Text(
                                            'Top tháng',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/Group_db.png')),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () => {
                                          Get.to(
                                              const MyDanhSachNguoiDungDangChoi(
                                                  title:
                                                      'TOP NGƯỜI CHƠI TRONG NĂM'),
                                              arguments: {"Loai": "1"})
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            'Top năm',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/Group_db.png')),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () => {
                                          Get.to(
                                              const MyDanhSachNguoiDungDangChoi(
                                                  title:
                                                      'TOP NGƯỜI CHƠI TRONG QUÝ'),
                                              arguments: {"Loai": "4"})
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            'Top quý',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ])))));
  }
}
