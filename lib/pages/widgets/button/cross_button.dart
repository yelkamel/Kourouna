import 'package:flutter/material.dart';

class CrossButton extends StatelessWidget {
  const CrossButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
            size: 40,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).primaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 15,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
