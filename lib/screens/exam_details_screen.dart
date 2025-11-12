import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/time_utils.dart';

class ExamDetailsScreen extends StatelessWidget {
  static const String route = '/details';
  final Exam exam;
  const ExamDetailsScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final c = exam.statusColor(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: c.withOpacity(0.18),
                  shape: BoxShape.circle,
                ),
                child: Icon(exam.icon, color: c, size: 48),
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.event),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          TimeUtils.formatDateTime(exam.dateTime),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Wrap(
                          spacing: 6,
                          runSpacing: -6,
                          children: exam.rooms
                              .map((r) => Chip(
                            label: Text(r),
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                          ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, color: c),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'До испитот: ${TimeUtils.timeUntil(exam.dateTime)}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: c),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.label_important_outline, color: c),
                      const SizedBox(width: 8),
                      Text(
                        _statusText(exam, DateTime.now()),
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        label: const Text('Назад'),
      ),
    );
  }

  String _statusText(Exam exam, DateTime now) {
    final onlyDate = DateTime(exam.dateTime.year, exam.dateTime.month, exam.dateTime.day);
    final today = DateTime(now.year, now.month, now.day);
    if (onlyDate.isBefore(today)) return 'Статус: поминат испит';
    if (onlyDate.isAtSameMomentAs(today)) return 'Статус: денес';
    return 'Статус: претстојен испит';
  }
}
