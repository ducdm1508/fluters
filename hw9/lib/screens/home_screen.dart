import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/bug_list_screen.dart';
import '../screens/create_bug_screen.dart';
import '../screens/statistics_screen.dart';
import '../screens/settings_screen.dart';

class BugMasterHome extends StatefulWidget {
  const BugMasterHome({Key? key}) : super(key: key);

  @override
  State<BugMasterHome> createState() => _BugMasterHomeState();
}

class _BugMasterHomeState extends State<BugMasterHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF2D9D48),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.bug_report_outlined,
                  color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            const Text('BugMaster'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          DashboardScreen(),
          BugListScreen(),
          CreateBugScreen(),
          StatisticsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2D9D48),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Tổng quan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report_outlined),
            label: 'Lỗi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Báo cáo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Thống kê',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }
}
