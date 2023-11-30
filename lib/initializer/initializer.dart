import 'package:flutter/material.dart';
import 'package:orch/orch.dart';

import '../modules/navigation/route_observer.dart';

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
  });

  final String? title;
  final List<NavigatorObserver>? navigatorObservers;
  final void Function(BuildContext context)? contextEnabledInitialization;
  final void Function()? initialization;
  final Future<void> Function()? preRunInitialization;
  final ThemeData? theme;
  final Widget? splash;

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
      home: Builder(builder: (BuildContext context) {
        if (widget.contextEnabledInitialization != null) widget.contextEnabledInitialization!(context);
        return widget.splash ?? Container();
      }),
    );
  }
}
