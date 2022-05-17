import 'package:logger/logger.dart';
import 'date_time.dart';

final logger = (Type type) => Logger(
  printer:CustomerPrinter(type.toString()),
  level: Level.verbose,
);

class CustomerPrinter extends LogPrinter {
  final String className;

  CustomerPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;
    return [color!('${getCurrentDateTxtTimeNow()} $emoji ${className.trim()}: $message')];
  }
}