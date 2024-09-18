import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';

/// AppScaffold
class AppScaffold extends StatefulWidget {
  /// Constructor
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.systemUiOverlayStyleIOS,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.header,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.gradient,
    this.drawer,
    this.scaffoldKey,
  });

  final GlobalKey? scaffoldKey;

  /// Scaffold Body
  final Widget body;

  ///AppBar
  final PreferredSizeWidget? appBar;

  /// SystemUiOverlayStyle
  final SystemUiOverlayStyle? systemUiOverlayStyleIOS;

  /// BackGround Color
  final Color? backgroundColor;

  /// Bottom Navigation Bar
  final Widget? bottomNavigationBar;

  final Widget? header;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final Gradient? gradient;
  final Widget? drawer;

  @override
  AppScaffoldState createState() => AppScaffoldState();

  static AppScaffoldState? of(BuildContext context, {bool nullOk = false}) {
    final AppScaffoldState? result =
    context.findAncestorStateOfType<AppScaffoldState>();
    if (nullOk || result != null) {
      return result;
    }
    throw 'AppScaffold.of() called with a'
        ' context that does not contain a AppScaffold.';
  }
}

class AppScaffoldState extends State<AppScaffold> {
  bool isOffline = false;

  /// setConnectivityStatus
  void setConnectivityStatus({bool isConnection = true}) {
    isOffline = isConnection;
    setState(() {});
  }

  Duration getDuration({bool? permanent = false}) {
    if (permanent!) {
      return const Duration(days: 365);
    } else {
      return const Duration(milliseconds: 4000);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: widget.gradient,
        color: widget.backgroundColor ?? Palette.blackColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        key: widget.scaffoldKey,
        drawer: widget.drawer,
        backgroundColor: widget.backgroundColor ?? Palette.whiteColor,
        bottomNavigationBar: widget.bottomNavigationBar,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        appBar: widget.appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.header != null)
              Container(
                color: Palette.whiteColor,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: widget.header,
                ),
              )
            else
              const SizedBox(),
            Expanded(
              child: widget.body,
            ),
          ],
        ),
      ),
    );
  }
}
