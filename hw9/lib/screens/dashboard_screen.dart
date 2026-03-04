import 'package:flutter/material.dart';
import '../services/mock_data.dart';
import '../widgets/stat_card.dart';
import '../widgets/bug_item_card.dart';
import '../widgets/pie_chart_painter.dart';
import 'bug_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bugs = MockData.bugs;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tổng quan hệ thống',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Hôm nay, 4 Tháng 3',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Stats Grid
          Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                StatCard(
                  value: '1,284',
                  label: 'Tổng cả lỗi',
                  change: '+12%',
                  isPositive: true,
                  icon: Icons.check_circle_outline,
                  color: const Color(0xFF27AE60),
                ),
                StatCard(
                  value: '45',
                  label: 'Chạy có ý',
                  change: '-5%',
                  isPositive: false,
                  icon: Icons.error_outline,
                  color: const Color(0xFFDC143C),
                ),
                StatCard(
                  value: '32',
                  label: 'Đang xử lý',
                  change: '+8%',
                  isPositive: true,
                  icon: Icons.schedule_outlined,
                  color: const Color(0xFFFFA500),
                ),
                StatCard(
                  value: '51',
                  label: 'Đã xử lý',
                  change: '+15%',
                  isPositive: true,
                  icon: Icons.done_all_outlined,
                  color: const Color(0xFF4A90E2),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Pie Chart
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lỗi theo hệ thống',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CustomPaint(
                    painter: PieChartPainter(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLegendItem('Mobile (25%)', const Color(0xFF27AE60)),
                    _buildLegendItem('Web (25%)', const Color(0xFF4A90E2)),
                    _buildLegendItem(
                        'Database (25%)', const Color(0xFFFFA500)),
                    _buildLegendItem('Server (25%)', const Color(0xFF9C27B0)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Recent Bugs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text(
              'Lỗi mới tìm ra',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bugs.length > 3 ? 3 : bugs.length,
            itemBuilder: (context, index) {
              return BugItemCard(
                bug: bugs[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BugDetailScreen(bug: bugs[index]),
                    ),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
