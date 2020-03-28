import 'package:kourouna/pages/screens/advice.dart';
import 'package:kourouna/pages/screens/distance.dart';
import 'package:kourouna/pages/screens/symptoms.dart';
import 'package:kourouna/pages/screens/virus.dart';
import 'package:kourouna/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kourouna/theme/theme.dart';

import 'blocs/blocs.dart';
import 'home.dart';
import 'simple_bloc_delegate.dart';
import 'utils/storageutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();

  final ApiRepository apiRepository = ApiRepository(apiClient: ApiClient());
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<CaseBloc>(
          create: (context) => CaseBloc(apiRepository: apiRepository),
        ),
//        BlocProvider<NewsBloc>(
        //         create: (context) => NewsBloc(apiRepository: apiRepository),
        //      ),
      ],
      child: MyApp(
        apiRepository: apiRepository,
      )));
}

class MyApp extends StatelessWidget {
  final ApiRepository apiRepository;

  const MyApp({Key key, @required this.apiRepository})
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
            child: Home(),
          ),
          routes: <String, WidgetBuilder>{
            '/virus': (BuildContext context) => new Virus(),
            '/symptoms': (BuildContext context) => new Symptoms(),
            '/advice': (BuildContext context) => new Advice(),
            '/distance': (BuildContext context) => new SocialDistance(),
          },
        );
      },
    );
  }
}
