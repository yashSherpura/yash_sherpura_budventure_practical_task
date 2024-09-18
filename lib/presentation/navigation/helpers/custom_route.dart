import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_navigator.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';

class CustomRoute<T> extends PopupRoute<T> {
  CustomRoute({
    required this.builder,
    this.appNavigator,
    this.isProvider = true,
    this.alertDialog = false,
    this.isBarrierDismissible = true,
  });

  final WidgetBuilder builder;
  final AppNavigator? appNavigator;
  final bool? isProvider;
  final bool alertDialog;
  final bool isBarrierDismissible;

  @override
  Color? get barrierColor => null;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => isBarrierDismissible;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  @override
  AnimationController createAnimationController() {
    return AnimationController(
      duration: transitionDuration,
      debugLabel: 'CustomPopupRoute',
      vsync: navigator!.overlay!,
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (alertDialog) {
      return PointerInterceptor(
        child: FadeTransition(
          opacity: animation,
          child: getChild(child, context),
        ),
      );
    } else {
      return PointerInterceptor(
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.8, 0.0), // adjust the position as you need
            end: Offset.zero,
          ).animate(animation),
          child: getChild(child, context),
        ),
      );
    }
  }

  Widget getChild(Widget child, BuildContext context) {
    return alertDialog
        ? GestureDetector(
            onTap: () {
              if (barrierDismissible) {
                AppNavigator().pop();
              }
            },
            child: Container(
              color: Palette.greyColor.withOpacity(0.5),
              child: GestureDetector(
                onTap: () {},
                child: AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Spacings.small),
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  content: isProvider!
                      ? Provider<AppNavigator>.value(
                          value: appNavigator!,
                          child: child,
                        )
                      : child,
                ),
              ),
            ),
          )
        : isProvider!
            ? Provider<AppNavigator>.value(
                value: appNavigator!,
                child: child,
              )
            : child;
  }
}
