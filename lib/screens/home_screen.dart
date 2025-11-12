import 'package:flutter/material.dart';
import '../data/mock_exams.dart';
import '../widgets/exam_card.dart';
import '../models/exam.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Exam> _exams;

  final String indexNumber = '223116';

  @override
  void initState() {
    super.initState();
    _exams = [...mockExams]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('📘 Распоред за испити - $indexNumber'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: _exams.length,
        itemBuilder: (_, i) => ExamCard(exam: _exams[i]),
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text(
                'Вкупно испити:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Chip(label: Text(_exams.length.toString())),
            ],
          ),
        ),
      ),
    );
  }
}
