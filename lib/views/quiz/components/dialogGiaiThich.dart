import 'package:app_aihieuquochoi/controllers/cauhoi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogBoxGiaiThich extends StatefulWidget {
  @override
  _DialogBoxGiaiThich createState() => _DialogBoxGiaiThich();
}

CauHoiController _controller = Get.put(CauHoiController());

class _DialogBoxGiaiThich extends State<DialogBoxGiaiThich> {
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
        child: GetBuilder<CauHoiController>(
            init: CauHoiController(),
            builder: (controller) => Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          left: Constants.padding,
                          top: Constants.avatarRadius + Constants.padding,
                          right: Constants.padding,
                          bottom: Constants.padding),
                      margin:
                          const EdgeInsets.only(top: Constants.avatarRadius),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(0xffFCCB17),
                          borderRadius:
                              BorderRadius.circular(Constants.padding),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 10),
                                blurRadius: 10),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(
                            child: Text(
                              _controller.questionNow.ten!,
                              style: const TextStyle(
                                  color: Color(0xffBB0303),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.topRight,
                                        margin:const EdgeInsets.only(top: 25),
                                        child: Padding(
                                          padding:const EdgeInsets.only(right: 0),
                                          child: Text(
                                            _controller.questionNow.moTa!,
                                            style:const TextStyle(
                                                color: Colors.black, height: 2),
                                          ),
                                        )),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/close.png'),
                                        width: 110,
                                      ),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          controller.checkTiepTuc();
                                          Future.delayed(
                                              const Duration(seconds: 2), () {
                                            controller.nextQuestion();
                                          });
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
                            child: Image.asset("assets/images/info.png")),
                      ),
                    ),
                  ],
                )));
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
