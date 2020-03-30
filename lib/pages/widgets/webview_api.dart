import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<script type="text/javascript" src="https://thevirustracker.com/embed.js">
</script><div class="thevirustracker-widget" data-ccountryid="ALL" data-base="ALLDATA"></div>
</html>
''';

class WebViewApi extends StatefulWidget {
  const WebViewApi({
    Key key,
  }) : super(key: key);

  @override
  _WebViewApiState createState() => _WebViewApiState();
}

class _WebViewApiState extends State<WebViewApi> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  void _onNavigationDelegateExample(
      WebViewController controller, BuildContext context) async {
    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.flat,
      bevel: 8,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _onNavigationDelegateExample(webViewController, context);
          // _controller.complete(webViewController);
        },
      ),
    );
  }
}
