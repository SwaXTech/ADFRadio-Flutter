import 'package:adfradio/util/logger.dart';
import 'package:flutter/services.dart';

class LogAPI{

  static const platform_name = "/log";
  static final platformChannel = MethodChannel(platform_name);
  static const DEBUG = 'debug';
  static const INFO = 'info';
  static const WARNING = 'warning';
  static const WTF = 'whatTheFailure';
  static const ERROR = 'error';

  LogAPI(){

    platformChannel.setMethodCallHandler((call){

      var logger;
      var method = call.method;

      if(method == ERROR)
        logger = Log.error;

      if(method == WARNING)
        logger = Log.warning;

      if(method == DEBUG)
        logger = Log.debug;

      if(method == INFO)
        logger = Log.info;

      if(method == WTF || method == null)
        logger = Log.wtf;

      logger("[Platform Channel Message] -> ${call.arguments}");

      return null;

    });

  }

}