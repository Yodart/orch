import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Initializer extends StatefulWidget {
  const Initializer({
    super.key,
    this.navigatorObservers,
    this.navigatorKey,
    this.title,
    this.contextEnabledInitialization,
    this.initialization,
    this.splash,
    this.preRunInitialization,
  });

  final String? title;
  final List<NavigatorObserver>? navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final void Function(BuildContext context)? contextEnabledInitialization;
  final void Function()? initialization;
  final Future<void> Function()? preRunInitialization;
  final Widget? splash;

  Future<void> run() async {
    if (preRunInitialization != null) await preRunInitialization!();
    runApp(this);
  }

  @override
  State<Initializer> createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  @override
  void initState() {
    super.initState();
    if (widget.initialization != null) widget.initialization!();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title ?? '',
      navigatorObservers: widget.navigatorObservers ?? [],
      navigatorKey: widget.navigatorKey,
      theme: ThemeData(fontFamily: GoogleFonts.comfortaa().fontFamily),
      home: Builder(builder: (BuildContext context) {
        if (widget.contextEnabledInitialization != null) widget.contextEnabledInitialization!(context);
        return widget.splash ?? Container();
      }),
    );
  }
}
