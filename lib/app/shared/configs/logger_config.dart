import 'package:logger/logger.dart';

class LoggerConfig {
  static PrettyPrinter printer() {
    return PrettyPrinter(
      errorMethodCount: 3,
    );
  }
}
