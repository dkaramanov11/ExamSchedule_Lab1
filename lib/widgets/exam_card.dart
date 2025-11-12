import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../utils/time_utils.dart';
import '../screens/exam_details_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final c = exam.statusColor(now);

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ExamDetailsScreen.route,
        arguments: exam,
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 96,
              decoration: BoxDecoration(
                color: c,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(exam.icon, size: 22, color: c),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            exam.subject,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      TimeUtils.formatDateTime(exam.dateTime),
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
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
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 18, color: c),
                        const SizedBox(width: 6),
                        Text('Остануваат: ${TimeUtils.timeUntil(exam.dateTime)}'),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
