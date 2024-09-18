import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_routes.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/helpers/navigation_service.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class AppNavigator {
  AppNavigator();

  static String onboardingNavigationRoute = 'onboardingNavigationRoute';

  static AppNavigator of(BuildContext context) {
    return Provider.of<AppNavigator>(context, listen: false);
  }

  @optionalTypeArgs
  Future<T?> push<T extends Object?>(
    AppRoute<T>? appRoute, {
    Object? arguments,
  }) async {
    final bool isNavigated = _navigateRootRoutes(appRoute);
    if (isNavigated) {
      return null;
    }

    final BuildContext? currentContext =
        NavigationService.navigatorKey.currentContext;
    if (currentContext == null) {
      Utility.showLog('navigator context is null');
      return null;
    }
    final NavigatorState? currentState =
        NavigationService.navigatorKey.currentState;
    if (currentState == null) {
      Utility.showLog('navigator state is null');
      return null;
    }

    final Route<T>? route = appRoute?.routeBuilder?.call(currentContext, this);
    if (route != null) {
      return currentState.push(route);
    } else {
      Utility.showLog('route is null');
    }
    return Future<T>.value();
  }

  Future<T?> pushReplacement<T extends Object?>(AppRoute<T>? appRoute) async {
    // TODO check if current route is appRoute
    final bool isNavigated = _navigateRootRoutes(appRoute);
    if (isNavigated) {
      return null;
    }

    final BuildContext? currentContext =
        NavigationService.navigatorKey.currentContext;
    if (currentContext == null) {
      Utility.showLog('navigator context is null');
      return null;
    }
    final NavigatorState? currentState =
        NavigationService.navigatorKey.currentState;
    if (currentState == null) {
      Utility.showLog('navigator state is null');
      return null;
    }

    final Route<T>? route = appRoute?.routeBuilder?.call(currentContext, this);
    if (route != null) {
      popUntilRoot();
      return NavigationService.navigatorKey.currentState
          ?.pushReplacement(route);
    } else {
      NavigationService.navigatorKey.currentState?.pop();
    }
    return Future<T>.value();
  }

  void pop([dynamic result]) {
    NavigationService.navigatorKey.currentState?.pop(result);
  }

  bool _navigateRootRoutes(AppRoute<dynamic>? appRoute) {
    return false;
  }

  void popUntilRoot() {
    NavigationService.navigatorKey.currentState
        ?.popUntil((Route<dynamic> route) => route.isFirst);
  }

  static void doPopUp(BuildContext context) {
    Navigator.pop(context);
  }
}
