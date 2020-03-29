import 'package:Kourouna/repositories/repositories.dart';
import 'package:Kourouna/service/local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Kourouna/theme/theme.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'home.dart';
import 'simple_bloc_delegate.dart';
import 'utils/storageutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();

  final ApiRepository apiRepository = ApiRepository(apiClient: ApiClient());
  BlocSupervisor.delegate = SimpleBlocDelegate();

  // Blocker l'orientation vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Navigation color change
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.deepOrange,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  //  Local Notification Init
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false);
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: null);
  // END

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CaseBloc>(
          create: (context) => CaseBloc(apiRepository: apiRepository),
        ),
        //     BlocProvider<NewsBloc>(
        //         create: (context) => NewsBloc(apiRepository: apiRepository),
        //      ),
      ],
      child: MyApp(
        apiRepository: apiRepository,
        localNotificationPlugin: flutterLocalNotificationsPlugin,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ApiRepository apiRepository;
  final FlutterLocalNotificationsPlugin localNotificationPlugin;

  const MyApp(
      {Key key, @required this.apiRepository, this.localNotificationPlugin})
      : assert(apiRepository != null),
        super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaseBloc, CaseState>(
      builder: (BuildContext context, CaseState state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: BlocProvider(
            create: (context) => CaseBloc(apiRepository: apiRepository),
            child: ChangeNotifierProvider<NotificationChanger>(
              create: (_) =>
                  NotificationChanger(service: localNotificationPlugin),
              child: Home(),
            ),
          ),
          /* routes: <String, WidgetBuilder>{
            '/virus': (BuildContext context) => new Virus(),
            '/symptoms': (BuildContext context) => new Symptoms(),
            '/advice': (BuildContext context) => new Advice(),
            '/distance': (BuildContext context) => new SocialDistance(),
          },
          onGenerateRoute: (RouteSettings rooter) {
            switch (rooter.name) {
              case '/symptoms':
                return FadePageRoute(screen: Symptoms());
            }
          },
          */
        );
      },
    );
  }
}
