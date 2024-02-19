class HiveConstants {
  HiveConstants._();

  static Config CONFIGS = const Config();

  static final INIT_BOXS = [CONFIGS.CONFIG_BOX, CONFIGS.SYSTEM_BOX];
}

class Config {
  const Config();

  String get CONFIG_BOX => "CONFIG_BOX";
  String get CONFIG_LOCALE => "CONFIG_LOCALE";
  String get SYSTEM_BOX => "SYSTEM_BOX";
}
