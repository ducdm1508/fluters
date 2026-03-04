import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BugMasterApp());
}

class BugMasterApp extends StatelessWidget {
  const BugMasterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BugMaster',
      theme: AppTheme.lightTheme,
      home: const BugMasterHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
