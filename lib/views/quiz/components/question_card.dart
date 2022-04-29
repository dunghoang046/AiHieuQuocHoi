// ignore_for_file: avoid_print

import 'package:app_aihieuquochoi/Unit/StatefulWrapper.dart';
import 'package:app_aihieuquochoi/models/CauHoiItem.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_aihieuquochoi/controllers/cauhoi_controller.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final CauHoiItem question;

  @override
  Widget build(BuildContext context) {
    CauHoiController _controller = Get.put(CauHoiController());
    return StatefulWrapper(
        onInit: () {
          if(checkNhacNen==true && _controller.lstdanhmuctieng.length>0){
            _controller.initNhacNen(_controller.lstdanhmuctieng[0]);
          }
          _controller.initcauhoi(question);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Text(
                question.ten!,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              ...List.generate(
                  question.lstCauTraLoiItem!.length,
                  (index) => (Option(
                        index: index,
                        text: question.lstCauTraLoiItem![index].ten!,
                        press: () =>
                            _controller.checkCauTLDung(question, index),
                            
                      ))),
              if (_controller.soLanTroGiup! < 3)
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  // padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Material(
                        // needed
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () =>
                              {_controller.confirmtrogiup5050(question,7)}, // needed
                          child: Image.asset(
                            "assets/images/5050.png",
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Material(
                          // needed
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () =>
                                {_controller.confirmtrogiup5050(question,8)}, // needed
                            child: Image.asset(
                              "assets/images/saovang.png",
                              width: 65,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Material(
                          // needed
                          color: Colors.transparent,
                          child: InkWell(
                            
                            onTap: () => {
                             _controller.confirmtrogiup5050(question,9)
                            }, // needed
                            child: Image.asset(
                              "assets/images/nguoithan.png",
                              width: 65,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }
}
