import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/exam_details_screen.dart';
import 'models/exam.dart';

void main() => runApp(const ExamsApp());

class ExamsApp extends StatelessWidget {
  const ExamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.indigo.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo.shade600,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
        ExamDetailsScreen.route: (ctx) {
          final exam = ModalRoute.of(ctx)!.settings.arguments as Exam;
          return ExamDetailsScreen(exam: exam);
        },
      },
      initialRoute: HomeScreen.route,
    );
  }
}
