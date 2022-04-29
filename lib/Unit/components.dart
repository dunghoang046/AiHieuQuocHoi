import 'package:app_aihieuquochoi/views/customdialogInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonContainer extends Container {
  final String text;
  final String strimage;
  final bool isselect;
  final VoidCallback mOnPressed;
  final double top;
  final double toptext;
  final double topimg;
  final double widthimg;
  ButtonContainer({
    this.text = "Ok",
    this.strimage = "",
    required this.mOnPressed,
    this.isselect = false,
    this.top = 0,
    this.topimg = 0,
    this.widthimg = 0,
    this.toptext = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: top),
        child: Stack(
          children: [
            Center(
              child: Image(
                  width: 300,
                  image: AssetImage(
                    strimage,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: toptext),
              child: MaterialButton(
                onPressed: () => {mOnPressed()},
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: isselect != true ? Colors.black : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class ButtonContainerHome extends Container {
  final String text;
  final String strimage;
  final bool isselect;
  final VoidCallback mOnPressed;
  final double top;
  final double topimg;
  final double heightimg;
  ButtonContainerHome({
    this.text = "Ok",
    this.strimage = "",
    required this.mOnPressed,
    this.isselect = false,
    this.top = 0,
    this.topimg = 0,
    this.heightimg = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 30,
            offset: Offset(0, 0),
          )
        ]),
        child: Stack(
          children: [
            Center(
              child: Image(height: heightimg, image: AssetImage(strimage)),
            ),
            Padding(
              padding: EdgeInsets.only(top: top),
              child: MaterialButton(
                onPressed: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return CustomDialogBoxInfo();
                  //     });
                  mOnPressed();
                },
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: isselect != true ? 0 : 10),
                  child: Text(
                    text,
                    style: TextStyle(
                        color:
                            isselect != true ? Colors.red[900] : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                )),
              ),
            )
          ],
        ));
  }
}

class ButtonLogin extends MaterialButton {
  // ignore: prefer_const_constructors_in_immutables
  final minWidth;
  final height;
  final bool isLoading;
  final Color backgroundColor;
  final Color borderColor;
  final String label;
  final Color labelColor;
  VoidCallback? mOnPressed;
  //  final VoidCallback? onLongPress;
  Key? key;

  ButtonLogin({
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black,
    this.label = 'OK',
    this.labelColor = Colors.blue,
    this.mOnPressed,
    this.isLoading = false,
    this.height,
    this.minWidth,
  }) : super(onPressed: mOnPressed);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        mOnPressed!();
      },
      child: Center(
        child: Text(label,
            style: TextStyle(
                color: Colors.white, fontSize: 18, letterSpacing: 1.0)),
      ),
    );
  }
}

class Alert extends AlertDialog {
  final String? titleText;
  final String? contentText;

  Alert({this.titleText, this.contentText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      title: Text(titleText!),
      content: Text(contentText!),
      actions: <Widget>[
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Ok'),
        )
      ],
    );
  }
}

class TextButtonAction extends MaterialButton {
  TextButtonAction({
    this.label = 'OK',
    required this.mOnPressed,
  }) : super(onPressed: mOnPressed);
  final String label;
  final VoidCallback mOnPressed;
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 25, 5),
        child: TextButton(
            onPressed: () {
              mOnPressed();
            },
            child: Text(label)));
  }
}

class ButtonAction extends MaterialButton {
  ButtonAction({
    Key? key,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black,
    this.label = 'OK',
    this.labelColor = Colors.blue,
    required this.mOnPressed,
    this.height,
    this.minWidth,
    required this.icons,
  }) : super(onPressed: mOnPressed);
  final minWidth;
  final height;
  final Color backgroundColor;
  final Color borderColor;
  final String label;
  final Color labelColor;
  final IconData icons;
  final VoidCallback mOnPressed;
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.fromLTRB(5, 10, 25, 5),
        child: MaterialButton(
            padding:const EdgeInsets.fromLTRB(5, 10, 5, 10),
            onPressed: () {
              mOnPressed();
            },
            color: backgroundColor,
            child: Row(
              children: [
                Icon(
                  icons,
                  size: 17,
                  color: Colors.white,
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: labelColor),
                ),
              ],
            )));
  }
}
