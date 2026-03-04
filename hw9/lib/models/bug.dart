import 'dart:ui';

enum BugSeverity { critical, high, medium, low }

class Bug {
  final String id;
  final String title;
  final String description;
  final BugSeverity severity;
  final String status;
  final String platform;
  final String reporterName;
  final String timestamp;

  Bug({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.status,
    required this.platform,
    required this.reporterName,
    required this.timestamp,
  });

  Color get severityColor {
    switch (severity) {
      case BugSeverity.critical:
        return const Color(0xFFDC143C);
      case BugSeverity.high:
        return const Color(0xFFFFA500);
      case BugSeverity.medium:
        return const Color(0xFF4A90E2);
      case BugSeverity.low:
        return const Color(0xFF27AE60);
    }
  }

  String get severityLabel {
    switch (severity) {
      case BugSeverity.critical:
        return 'NGHIÊM TRỌNG';
      case BugSeverity.high:
        return 'CAO';
      case BugSeverity.medium:
        return 'BÌNH THƯỜNG';
      case BugSeverity.low:
        return 'THẤP';
    }
  }
}
