import '../config/config.dart';

class LoggerConfig {
  LoggerConfig({
    required this.logRouteNavigation,
    required this.logExceptions,
  });

  static LoggerConfig get instance => Config.instance.loggerConfig;

  static LoggerConfig all = LoggerConfig(
    logRouteNavigation: true,
    logExceptions: true,
  );

  static LoggerConfig none = LoggerConfig(
    logRouteNavigation: false,
    logExceptions: false,
  );

  final bool logRouteNavigation;
  final bool logExceptions;
}
