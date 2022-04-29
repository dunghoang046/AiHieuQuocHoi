import 'package:app_aihieuquochoi/controllers/cauhoi_controller.dart';
import 'package:app_aihieuquochoi/models/CauHoiItem.dart';
import 'package:app_aihieuquochoi/models/DanhMucTiengItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogBoxTroGiup extends StatefulWidget {
   final DanhMucTiengItem danhMucTiengItem;
  final CauHoiItem cauHoiItem;
  final int Loai;

  const DialogBoxTroGiup ({ Key? key, required this.danhMucTiengItem,required this.cauHoiItem,required this.Loai}): super(key: key);

  @override
  _DialogBoxTroGiup createState() => _DialogBoxTroGiup();
}
CauHoiController _controller = Get.put(CauHoiController());

class _DialogBoxTroGiup extends State<DialogBoxTroGiup> {
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
                          top: 20,
                          right: Constants.padding,
                          bottom: Constants.padding),
                      margin:
                          const EdgeInsets.only(top:20),
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
                              widget.danhMucTiengItem.ten!,
                              style: const TextStyle(
                                  color: Color(0xffBB0303),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 20, height: 14),         
                           Center(
                            child: Text(
                              widget.danhMucTiengItem.moTa??'',
                              style:const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  ),
                            ),
                          ),
                          Column(
                            children: [                              
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,                                  
                                  children: [                                  
                                  Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/close.png'),
                                        width: 115,
                                      ),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () {                                                                                
                                          controller.start_animationController(widget.cauHoiItem,true,widget.Loai);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                          child: Text(
                                            'Đồng ý',
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
                                 const SizedBox(width: 20, height: 20),                                
                                           Stack(
                                  children: [
                                    const Center(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/close.png'),
                                        width: 115,
                                      ),
                                    ),
                                    Center(
                                      child: MaterialButton(
                                        onPressed: () {                                                                                
                                         controller.start_animationController(widget.cauHoiItem,false,widget.Loai);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                ],)
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   left: Constants.padding,
                    //   right: Constants.padding,
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.transparent,
                    //     radius: Constants.avatarRadius,
                    //     child: ClipRRect(
                    //         borderRadius: const BorderRadius.all(
                    //             Radius.circular(Constants.avatarRadius)),
                    //         child: Image.asset("assets/images/info.png")),
                    //   ),
                    // ),
                  ],
                )));
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
