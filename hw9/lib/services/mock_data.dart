import '../models/bug.dart';

class MockData {
  static List<Bug> get bugs => [
        Bug(
          id: 'BUG-1024',
          title: 'Lỗi không hiển thị giỏ hàng trên iOS 17.4',
          description:
              'Ứng dụng bị crash ngay sau khi người dùng nhấn "Thanh toán" trong giỏ hàng',
          severity: BugSeverity.critical,
          status: 'Đang xử lý',
          platform: 'Mobile App',
          reporterName: 'Nguyễn Văn A',
          timestamp: 'Hôm nay',
        ),
        Bug(
          id: 'BUG-1025',
          title: 'API thanh toán phản hồi chậm (> 5s)',
          description: 'Endpoint /checkout mất trên 5 giây để phản hồi',
          severity: BugSeverity.high,
          status: 'Mới',
          platform: 'E-Commerce',
          reporterName: 'Trần Thị B',
          timestamp: 'Hôm qua',
        ),
        Bug(
          id: 'BUG-1026',
          title: 'Sai lệch màu UI trên Safari',
          description: 'Các thành phần UI có màu khác khi xem trên Safari',
          severity: BugSeverity.medium,
          status: 'Mới',
          platform: 'Website',
          reporterName: 'Lê Minh C',
          timestamp: '2 ngày trước',
        ),
        Bug(
          id: 'BUG-1027',
          title: 'Thông báo không gửi cho user',
          description: 'Push notification không đến cho một số users',
          severity: BugSeverity.high,
          status: 'Đang xử lý',
          platform: 'Mobile App',
          reporterName: 'Phạm Văn D',
          timestamp: '3 ngày trước',
        ),
        Bug(
          id: 'BUG-1028',
          title: 'Lỗi typo trên trang login',
          description: 'Text "Đăng nhập" viết sai',
          severity: BugSeverity.low,
          status: 'Đã sửa',
          platform: 'Website',
          reporterName: 'Hoàng Văn E',
          timestamp: '5 ngày trước',
        ),
      ];
}
