import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: const Text(
            'Cài đặt',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
        _buildSettingTile(
          title: 'Thông báo',
          subtitle: 'Quản lý thông báo',
          icon: Icons.notifications_outlined,
        ),
        _buildSettingTile(
          title: 'Tài khoản',
          subtitle: 'Thay đổi thông tin tài khoản',
          icon: Icons.account_circle_outlined,
        ),
        _buildSettingTile(
          title: 'Giao diện',
          subtitle: 'Sáng / Tối',
          icon: Icons.brightness_7_outlined,
        ),
        _buildSettingTile(
          title: 'Về ứng dụng',
          subtitle: 'Phiên bản 1.0.0',
          icon: Icons.info_outlined,
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
