import 'package:Kourouna/pages/widgets/card/file_download_card.dart';
import 'package:Kourouna/pages/widgets/card/link_card.dart';
import 'package:Kourouna/pages/widgets/card/nolt_card.dart';
import 'package:Kourouna/pages/widgets/card/notification_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              NotificationCard(),
              LinkCard(
                  url: 'https://kourouna.nolt.io/',
                  title: "Une sugestion pour l'application ?"),
              FileDownloadCard(),
              LinkCard(
                  url: 'https://www.gouvernement.fr/info-coronavirus',
                  title: "Les instructions du gouvernement"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
