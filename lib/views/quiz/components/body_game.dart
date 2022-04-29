import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:app_aihieuquochoi/constants.dart';
import 'package:app_aihieuquochoi/controllers/cauhoi_controller.dart';
// import 'package:flutter_svg/svg.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class BodyGame extends StatelessWidget {
  const BodyGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    CauHoiController _questionController = Get.put(CauHoiController());
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Mask.png"), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            GetBuilder<CauHoiController>(
                init: CauHoiController(),
                builder: (controller) => SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Image(
                                      height: 35,
                                      image: AssetImage(
                                        'assets/images/sao.png',
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Container(
                                    height: 25,
                                    margin: const EdgeInsets.only(left: 0),
                                    // ignore: prefer_const_constructors
                                    decoration: BoxDecoration(
                                        color: const Color(0xff560101),
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          right: Radius.elliptical(30, 30),
                                        )),
                                    child: MaterialButton(
                                        onPressed: () => {},
                                        child: Text(
                                         _questionController.soCauTraLoiDung.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              'assets/images/logo_g.png',
                              width: ScreenUtil().setWidth(150),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: ProgressBar(),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          Row(
                            children: [
                              Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Obx(
                              () => Text.rich(
                                TextSpan(
                                  text:
                                      "Câu hỏi ${_questionController.questionNumber.value}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(color: kSecondaryColor),
                                  children: [
                                    TextSpan(
                                      text:
                                          "/${_questionController.questions.length}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(color: kSecondaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(                          
                           child:Text(_questionController.txtoption!,style:const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                           onTap: ()=>{
                             if(_questionController.isTiepTuc==true){
                               _questionController.nextQuestion()
                             }else{
                               _questionController.giaiThich()
                             }
                           },
                           ),
                            ],
                          ),
                          // Divider(thickness: 1.5),
                          const SizedBox(height: kDefaultPadding),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: PageView.builder(
                              // Block swipe to next qn
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _questionController.pageController,
                              onPageChanged: _questionController.updateTheQnNum,
                              itemCount: _questionController.questions.length,
                              itemBuilder: (context, index) => QuestionCard(
                                  question:
                                      _questionController.questions[index]),
                            ),
                          )),
                        ],
                      ),
                    ))
          ],
        ));
  }
}
