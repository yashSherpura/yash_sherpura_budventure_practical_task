import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/injector.dart';
import 'package:yash_sherpura_budventure_task/presentation/bottom_bar/bottom_bar_screen.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_navigator.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/helpers/navigation_service.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/scope_widget.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

Future<void> main() async {
  initApp();
}

Future<void> initApp() async {
  runZonedGuarded<Future<dynamic>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final IOC ioc = IOC.appScope();
    runApp(
      MyApp(scope: ioc),
    );
  }, (Object error, StackTrace stackTrace) async {
    Utility.showLog('main error:$error');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.scope});

  final IOC scope;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final IOC scope;

  @override
  void initState() {
    super.initState();
    scope = widget.scope;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
    return ScopeWidget(
      scope: scope,
      child: Provider<AppNavigator>(
        create: (BuildContext context) => AppNavigator(),
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: StringConstants.appName,
          home: const BottomNavBarScreen(),
        ),
      ),
    );
  }
}
