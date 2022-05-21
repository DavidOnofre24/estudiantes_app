import 'package:estudiantes_app/pages/home_page.dart';
import 'package:estudiantes_app/pages/notification_page.dart';
import 'package:estudiantes_app/pages/report_page.dart';
import 'package:estudiantes_app/pages/student_detail_page.dart';
import 'package:estudiantes_app/pages/students_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomePage(),
  'students': (_) => const StudentsPage(),
  'studentDetail': (_) => const StudentDetail(),
  'report': (_) => const ReportPage(),
  'notifications': (_) => const NotificationPage()
};
