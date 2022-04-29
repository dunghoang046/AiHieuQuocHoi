import 'package:app_aihieuquochoi/block/login_block/Auth_event.dart';
import 'package:app_aihieuquochoi/controllers/dangky_controller.dart';
import 'package:app_aihieuquochoi/main.dart';
import 'package:app_aihieuquochoi/models/loginItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MyDangKy extends StatelessWidget {
  const MyDangKy({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDangKypage(),
    );
  }
}

TextEditingController? txtten ;
TextEditingController? txtsdt ;
TextEditingController? txtemail ;
TextEditingController? txtmatkhau ;
TextEditingController? txtsdtnguoimoi;

class MyDangKypage extends StatefulWidget {
  const MyDangKypage({Key? key}) : super(key: key);

 
  @override
  _MyDangKy createState() => _MyDangKy();
}


class _MyDangKy extends State<MyDangKypage> {
  
@override
void dispose() {
  txtten?.dispose();
  txtsdt?.dispose();
  txtmatkhau?.dispose();
  txtemail?.dispose();
  txtsdtnguoimoi?.dispose();
  super.dispose();
}
 @override
  void initState() {
  txtten = TextEditingController();
 txtsdt = TextEditingController();
 txtemail = TextEditingController();
 txtmatkhau = TextEditingController();
 txtsdtnguoimoi = TextEditingController();
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
            ),
            child: GetBuilder<DangKyController>(
                init: DangKyController(),
                builder: (controller) => KeyboardDismisser(
                        child: Stack(
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: ScreenUtil().setWidth(200),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(
                                'Đăng Ký',
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            // SizedBox(
                            //   height: ScreenUtil().setHeight(20),
                            // ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 250, left: 50, right: 50),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    // ignore: avoid_unnecessary_containers
                                    Container(
                                        child: Stack(
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/images/Path.png')),
                                        TextFormField(
                                          textAlign: TextAlign.center,
                                          controller: txtten,
                                          decoration: const InputDecoration(
                                            hintText: "Nhập họ tên",
                                            alignLabelWithHint: true,
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.0),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Vui lòng nhập họ tên';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    )),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Stack(
                                          children: [
                                            const Image(
                                                image: AssetImage(
                                                    'assets/images/Path.png')),
                                            TextFormField(
                                              textAlign: TextAlign.center,
                                              controller: txtsdt,
                                              decoration: const InputDecoration(
                                                hintText: "Số điện thoại",
                                                alignLabelWithHint: true,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Vui lòng nhập họ tên';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Stack(
                                          children: [
                                            const Image(
                                                image: AssetImage(
                                                    'assets/images/Path.png')),
                                            TextFormField(
                                              textAlign: TextAlign.center,
                                              controller: txtmatkhau,
                                              obscureText: showPassword,
                                              // ignore: missing_return
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Vui lòng nhập mật khẩu';
                                                }
                                              },
                                              decoration: const InputDecoration(
                                                hintText: "Mật khẩu",
                                                alignLabelWithHint: true,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              ),
                                            ),
                                            handleShowPass()
                                          ],
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Stack(
                                          children: [
                                            const Image(
                                                image: AssetImage(
                                                    'assets/images/Path.png')),
                                            TextFormField(
                                              textAlign: TextAlign.center,
                                              controller: txtemail,
                                              decoration: const InputDecoration(
                                                hintText: "Email",
                                                alignLabelWithHint: true,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Vui lòng nhập họ tên';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Stack(
                                          children: [
                                            const Image(
                                                image: AssetImage(
                                                    'assets/images/Path.png')),
                                            TextFormField(
                                              textAlign: TextAlign.center,
                                              controller: txtsdtnguoimoi,
                                              decoration: const InputDecoration(
                                                hintText:
                                                    "Số điện thoại người mời",
                                                alignLabelWithHint: true,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: Stack(
                                          children: [
                                            const Image(
                                                image: AssetImage(
                                                    'assets/images/btn_dangky.png')),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: MaterialButton(
                                                onPressed: () {
                                                  dangky();
                                                },
                                                child: const Center(
                                                  child: Text(
                                                    'Đăng Ký',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    InkWell(
                                      onTap: () {
                                        txtten?.text = '';
                                        txtsdt?.text = '';
                                        txtemail?.text = '';
                                        txtmatkhau?.text = '';
                                        Get.offAll(const MyHomePage());
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Đăng nhập',
                                            style: TextStyle(
                                                color: Colors.red[900],
                                                fontSize: 20,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w900))
                                      ])),
                                    )
                                  ],
                                )),
                          ),
                        )
                      ],
                    )))));
  }

  final DangKyController controller = Get.put(DangKyController());
  dangky() async {
    if (_formKey.currentState!.validate()) {
      LoginItem objlogin = LoginItem();
      objlogin.tenhienthi = txtten?.text;
      objlogin.SoDienThoai = txtsdt?.text;
      objlogin.password = txtmatkhau?.text;
      objlogin.email = txtemail?.text;
      objlogin.SoDienThoaiNguoiMoi = txtsdtnguoimoi?.text;
      LoginEvent loginevent = LoginEvent();
      loginevent.logindata = objlogin;
      // controller.dangky(loginevent);
      controller.dangky(loginevent);
    }
  }

  handleShowPass() {
    return Container(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: !showPassword
            ? const Icon(Icons.remove_red_eye, color: Colors.grey, size: 20)
            : const Icon(Icons.visibility_off, color: Colors.grey, size: 20),
        onPressed: () {
          setState(() => showPassword = !showPassword);
        },
      ),
    );
  }
}
