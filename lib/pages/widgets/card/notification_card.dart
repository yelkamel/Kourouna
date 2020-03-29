import 'package:Kourouna/service/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key key}) : super(key: key);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  void onPressNotification() {
    final notificationService =
        Provider.of<NotificationChanger>(context, listen: false);

    if (!notificationService.allowNotification) {
      notificationService.requestIOSPermissions();
    }

    notificationService.switchNotification();
  }

  @override
  Widget build(BuildContext context) {
    final notificationService = Provider.of<NotificationChanger>(context);
    return NeuCard(
      curveType: CurveType.flat,
      bevel: 8,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 15, top: 15, left: 15, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  notificationService.allowNotification
                      ? 'Activer'
                      : 'Désactiver',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'Apercu',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Notification',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'Apercu',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            NeuSwitch<int>(
              backgroundColor: Theme.of(context).cardTheme.color,
              onValueChanged: (value) => onPressNotification(),
              groupValue: notificationService.allowNotification ? 1 : 0,
              children: {
                0: Padding(
                    padding: EdgeInsets.all(7), child: Icon(Icons.alarm_off)),
                1: Padding(
                    padding: EdgeInsets.all(7), child: Icon(Icons.alarm_on)),
              },
            )
          ],
        ),
      ),
    );
  }
}
