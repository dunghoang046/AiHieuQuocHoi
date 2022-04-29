
import 'package:app_aihieuquochoi/Unit/components.dart';
import 'package:app_aihieuquochoi/block/login_block/Auth_event.dart';
import 'package:app_aihieuquochoi/controllers/login_controller.dart';
import 'package:app_aihieuquochoi/models/loginItem.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
 import 'package:app_aihieuquochoi/views/dangky.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLogin createState() => _MyLogin();
}

TextEditingController? txtsdtlg;
TextEditingController? txtmatkhaulg;

bool showPassword = true;

class _MyLogin extends State<MyLogin> {
  @override
  void initState() {
    getLogin();
    controller.GetOTP();
    txtsdtlg = TextEditingController();
    txtmatkhaulg = TextEditingController();
    super.initState();
  }
@override
  void dispose() {
    txtsdtlg?.dispose();
    txtmatkhaulg?.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => KeyboardDismisser(
                child: Stack(children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: ScreenUtil().setWidth(200),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 250, left: 50, right: 50),
                    child: Column(
                      children: [
                        Form(
                            key: _formKey,
                            child: Column(children: [
                              Container(
                                  margin:const EdgeInsets.only(top: 0),
                                  child: Stack(
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/Path.png')),
                                      TextFormField(
                                        textAlign: TextAlign.center,
                                        controller: txtsdtlg,
                                        decoration: const InputDecoration(
                                          hintText: "Số điện thoại",
                                          alignLabelWithHint: true,
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0),
                                        ),
                                        // ignore: missing_return
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
                                          image: AssetImage(
                                              'assets/images/Path.png')),
                                      TextFormField(
                                        textAlign: TextAlign.center,
                                        controller: txtmatkhaulg,
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
                                  ))
                            ])),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Stack(
                              children: [
                                const Image(
                                    image: AssetImage(
                                        'assets/images/btn_dangky.png')),
                                Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: _onLoginClick1())
                              ],
                            )),
                        MaterialButton(
                          onPressed: () async {
                            loginFingerPrint();
                          },
                          child: const Icon(
                            Icons.fingerprint,
                            color: Colors.blue,
                            size: 70,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(const MyDangKypage());
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Đăng ký',
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w900))
                          ])),
                        )
                      ],
                    )),
              ),
            ])));
  }

  final LoginController controller = Get.put(LoginController());
  Widget _onLoginClick1() {
    return ButtonLogin(
      isLoading: true,
      backgroundColor: Colors.white,
      label: 'Đăng nhập',
      mOnPressed: () => {_login()},
    );
  }

  void getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences!.getString("sodienthoai") != null) {
      txtsdtlg?.text = sharedPreferences!.getString("sodienthoai").toString();
    }
  }

  _login() async {
    var checkinter = await checkinternet();
    if (!checkinter) {
    } else if (_formKey.currentState!.validate()) {
      String? _sodeinthoai = txtsdtlg?.text;
      String? _password = txtmatkhaulg?.text;
      sharedPreferences!.setString("password", txtmatkhaulg!.text);
      if ((_sodeinthoai == null ||
              (_sodeinthoai != null && _sodeinthoai.isEmpty)) &&
          sharedPreferences!.getString("sodienthoai") != null) {
        _sodeinthoai = sharedPreferences?.getString("sodienthoai");
        sharedPreferences?.setString("sodienthoai", _sodeinthoai!);
      } else {
        sharedPreferences?.setString("sodienthoai", txtsdtlg!.text);
      }
      LoginItem objlogin = LoginItem();
      objlogin.checkFingerprint = "true";
      objlogin.lang = "vi";
      objlogin.password = _password;
      objlogin.SoDienThoai = txtsdtlg!.text;
      LoginEvent loginevent = LoginEvent();
      loginevent.logindata = objlogin;
      controller.login(loginevent);
    }
  }

  void loginFingerPrint() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences!.getString("checkFingerPrint") != null) {
      checkFingerPrint =
          sharedPreferences!.getString("checkFingerPrint")!.toLowerCase() ==
              'true';
      if (checkFingerPrint == true) {
        if (sharedPreferences!.getString("sodienthoai") != null &&
            sharedPreferences!.getString("password") != null) {
          LoginItem objlogin = LoginItem();
          objlogin.password = sharedPreferences!.getString("password");
          objlogin.SoDienThoai = sharedPreferences!.getString("sodienthoai");
          LoginEvent loginevent = LoginEvent();
          loginevent.logindata = objlogin;
          controller.login(loginevent);
        }
      } else {
        Get.snackbar("Thông báo", "Bạn chưa cấu hình đăng nhập bằng vân tay.",
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(255, 148, 11, 1));
      }
    } else {
      Get.snackbar("Thông báo", "Bạn chưa cấu hình đăng nhập bằng vân tay.",
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 148, 11, 1));
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
