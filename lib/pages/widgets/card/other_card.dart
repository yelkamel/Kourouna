import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OtherSituationCard extends StatelessWidget {
  final String cardTitle;
  final String safeTitle;
  final String dangerTitle;

  final int safeCase;
  final int dangerCase;
  final double percentChange;
  final Icon icon;
  final Color color;
  final Color cardColor;

  const OtherSituationCard({
    Key key,
    @required this.cardTitle,
    @required this.safeTitle,
    @required this.safeCase,
    @required this.dangerCase,
    @required this.percentChange,
    this.icon,
    this.cardColor = AppColors.green,
    @required this.color,
    this.dangerTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat("#,###");

    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                width: screenWidth(context),
                height: screenHeight(context, percent: 0.21),
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 20,
                        spreadRadius: 3.5,
                        offset: Offset(0, 13)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 40,
                          margin: EdgeInsets.all(15),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.transparentBlack,
                              borderRadius: BorderRadius.circular(5)),
                          child: RichText(
                              text: TextSpan(
                            text: "$cardTitle".toUpperCase(),
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                safeCase != null
                                    ? formatter.format(safeCase)
                                    : '-',
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 29),
                                ),
                              ),
                              const YMargin(5),
                              Text(
                                safeTitle ?? "",
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                dangerCase != null
                                    ? formatter.format(dangerCase)
                                    : '-',
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 29),
                                ),
                              ),
                              const YMargin(5),
                              Text(
                                dangerTitle,
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
