import 'package:flutter/material.dart';

class Exam {
  final String subject;
  final DateTime dateTime;
  final List<String> rooms;

  const Exam({
    required this.subject,
    required this.dateTime,
    required this.rooms,
  });

  IconData get icon {
    final s = subject.toLowerCase();
    if (s.contains('матем') || s.contains('алгеб')) return Icons.functions;
    if (s.contains('мреж') || s.contains('network')) return Icons.router;
    if (s.contains('бази') || s.contains('database')) return Icons.storage;
    if (s.contains('софтв') || s.contains('oop') || s.contains('прог')) return Icons.code;
    if (s.contains('ос') || s.contains('оператив')) return Icons.memory;
    if (s.contains('веб')) return Icons.language;
    if (s.contains('вешт') || s.contains('ai')) return Icons.psychology;
    return Icons.school;
  }

  Color statusColor(DateTime now) {
    final onlyDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final today = DateTime(now.year, now.month, now.day);
    if (onlyDate.isBefore(today)) return Colors.grey.shade400;
    if (onlyDate.isAtSameMomentAs(today)) return Colors.orange;
    return Colors.green.shade600;
  }
}
