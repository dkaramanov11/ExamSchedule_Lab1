import 'package:intl/intl.dart';

class TimeUtils {
  static String formatDateTime(DateTime dt) {
    final d = DateFormat('dd.MM.yyyy');
    final t = DateFormat('HH:mm');
    return '${d.format(dt)}  •  ${t.format(dt)}';
  }

  static String timeUntil(DateTime target, {DateTime? now}) {
    now ??= DateTime.now();
    Duration diff = target.difference(now);
    final negative = diff.isNegative;
    diff = diff.abs();

    final days = diff.inDays;
    final hours = diff.inHours - days * 24;

    if (negative) return 'Поминати $days дена';
    return '$days дена, $hours часа';
  }
}
