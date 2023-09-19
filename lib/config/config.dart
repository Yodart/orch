import '../logger/logger_config.dart';

enum ConfigEnv { prod, dev, proxy }

class Config {
  Config._();
  static final Config _instance = Config._();
  static Config get instance => _instance;

  /// Sets up up the config for the whole app, this should be called before your
  /// runApp function @ main.dart.
  void init({LoggerConfig? logger}) {
    loggerConfig = logger ?? LoggerConfig.all;
  }

  late final LoggerConfig loggerConfig;

  ConfigEnv get env {
    return ConfigEnv.proxy;
    const String env = String.fromEnvironment('env', defaultValue: 'prod');
    if (env == 'proxy') return ConfigEnv.proxy;
    if (env == 'dev') return ConfigEnv.dev;
    return ConfigEnv.prod;
  }
}
