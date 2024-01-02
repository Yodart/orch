import 'package:flutter/material.dart';
import 'package:orch/modules/navigation/route_observer.dart';
import 'package:orch/orch.dart';

class OrchAppInitializer extends StatefulWidget {
  const OrchAppInitializer({
    super.key,
    this.navigatorObservers,
    this.title,
    this.contextEnabledInitialization,
    this.initialization,
    this.splash,
    this.theme,
    this.preRunInitialization,
    this.locale,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.localizationsDelegates,
  });

  final String? title;
  final List<NavigatorObserver>? navigatorObservers;
  final void Function(BuildContext context)? contextEnabledInitialization;
  final void Function()? initialization;
  final Future<void> Function()? preRunInitialization;
  final ThemeData? theme;
  final Widget? splash;
  final Locale? locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  Future<void> run() async {
    if (preRunInitialization != null) await preRunInitialization!();
    runApp(this);
  }

  @override
  State<OrchAppInitializer> createState() => _OrchAppInitializerState();
}

class _OrchAppInitializerState extends State<OrchAppInitializer> {
  @override
  void initState() {
    super.initState();
    if (widget.initialization != null) widget.initialization!();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title ?? '',
      navigatorObservers: [OrchRouteObserver.instance, ...widget.navigatorObservers ?? []],
      navigatorKey: OrchNavigator.instance.key,
      theme: widget.theme,
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
      localizationsDelegates: widget.localizationsDelegates,
      home: Builder(builder: (BuildContext context) {
        if (widget.contextEnabledInitialization != null) widget.contextEnabledInitialization!(context);
        return widget.splash ?? Container();
      }),
    );
  }
}
