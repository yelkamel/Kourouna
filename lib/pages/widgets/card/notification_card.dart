import 'package:Kourouna/service/local_notification.dart';
import 'package:flutter/material.dart';
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
    return Card(
      margin: Theme.of(context).cardTheme.margin,
      shape: Theme.of(context).cardTheme.shape,
      elevation: Theme.of(context).cardTheme.elevation,
      color: Theme.of(context).cardTheme.color,
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
            GestureDetector(
              child: Switch(
                value: notificationService.allowNotification,
                onChanged: (value) => onPressNotification(),
              ),
              onTap: onPressNotification,
            )
          ],
        ),
      ),
    );
  }
}
