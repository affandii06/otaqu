import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otaqu/provider/app_intro_provider.dart';
import 'package:otaqu/provider/destination_provider.dart';
import 'package:otaqu/screen/app_intro.dart';
import 'package:otaqu/screen/destination.dart';
import 'package:otaqu/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AppIntroProvider>(create: (context)=> AppIntroProvider()),
          ChangeNotifierProvider<DestinationProvider>(create: (context)=> DestinationProvider()),
        ],
        child: Consumer<AppIntroProvider>(
          builder: (context, appIntro, _) {
            appIntro.checkAppIntro();
            return CupertinoApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name){
                  case AppIntro.id :
                    return CupertinoPageRoute(builder: (_) => const AppIntro(), settings: settings);
                  case Home.id :
                    return CupertinoPageRoute(builder: (_) => const Home(), settings: settings);
                  case Destination.id :
                    return CupertinoPageRoute(builder: (_) => const Destination(), settings: settings);
                  default:
                    return CupertinoPageRoute(builder: (_) => const AppIntro(), settings: settings);
                }
              },
              home: appIntro.status == true ? const Home() : const AppIntro(),
            );
          }
        )
      )
    );
  }
}