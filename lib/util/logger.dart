import 'package:logger/logger.dart';

class Log{

  static final _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter(colors: false)),
  );

  static void setLogLevel(level){
    Logger.level = level;
  }

  static void debug(msg) => _logger.d(msg);
  static void info(msg) => _logger.i(msg);
  static void warning(msg) => _logger.w(msg);
  static void error(msg) => _logger.e(msg);
  static void wtf(msg) => _logger.wtf(msg);

}