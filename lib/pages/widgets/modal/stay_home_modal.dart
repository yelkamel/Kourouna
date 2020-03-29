import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';

class StayHomeModal extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  StayHomeModal(this.options) : super(options);

  @override
  final illustrationKey = 'images/mytemplate.png';
  @override
  Color get primaryColor =>
      options.primaryColor ??
      Color(
          0xff000000); // The default primary color of the template is Colors.black.
  @override
  final maxWidth =
      400; // In most situations, the value is the illustration size.
  @override
  final maxHeight = 600;
  @override
  final bodyMargin = 10;

  // You need to adjust the layout to fit into your illustration.
  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(10),
        child: Text("Null Part rester chez toi"),
      ),
      Positioned(
        top: percentH(40),
        height: percentH(42),
        left: percentW(10),
        right: percentW(10),
        child: Container(
          color: Colors.black12,
          child: Text("Il ne faut pas sortir pour l'instant!"),
        ),
      ),
      Positioned(
        bottom: percentW(10),
        left: percentW(10),
        right: percentW(10),
        child: Container(
          color: Colors.red,
        ),
      ),
    ];
  }
}
