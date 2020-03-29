import 'package:Kourouna/pages/widgets/card/file_download_card.dart';
import 'package:Kourouna/pages/widgets/card/link_card.dart';
import 'package:Kourouna/pages/widgets/card/notification_card.dart';
import 'package:Kourouna/pages/widgets/card/share_card.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                YMargin(30),
                NotificationCard(),
                YMargin(30),
                LinkCard(
                    url: 'https://kourouna.nolt.io/',
                    title: "Une sugestion pour l'application ?"),
                YMargin(30),
                FileDownloadCard(),
                YMargin(30),
                LinkCard(
                    url: 'https://www.gouvernement.fr/info-coronavirus',
                    title: "Les instructions du gouvernement"),
                YMargin(30),
                ShareCard(),
                YMargin(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
