import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:app_aihieuquochoi/controllers/cauhoi_controller.dart';
import 'package:just_audio/just_audio.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,    
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CauHoiController>(
        init: CauHoiController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kWhiteColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            // return kGrayColor;
            return kBlackColor;
          }

          String imgbg = "assets/images/bg_da.png";
          String imgbgselect = "assets/images/btnselect.png";
          String getTheRightbgimg() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return imgbgselect;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return imgbg;
              }
            }
            // return kGrayColor;
            return imgbg;
          }

          final _playercauhoi = AudioPlayer();
          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }
          return  InkWell(
                onTap: qnController.isAnswered == false ? press : null,
                child: Container(
                  margin: const EdgeInsets.only(top: kDefaultPadding),
                  // padding: EdgeInsets.all(kDefaultPadding),
                  padding: const EdgeInsets.fromLTRB(10, 22, 0, 22),
                  decoration: BoxDecoration(
                      // ignore: unnecessary_new
                      image: new DecorationImage(
                    image: AssetImage(getTheRightbgimg()),
                    fit: BoxFit.cover,
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          " $text",
                          style: TextStyle(
                              color: getTheRightColor(),
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
              );
        });
  }
}
