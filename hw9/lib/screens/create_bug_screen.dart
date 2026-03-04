import 'package:flutter/material.dart';
import '../widgets/dotted_border.dart';

class CreateBugScreen extends StatefulWidget {
  const CreateBugScreen({Key? key}) : super(key: key);

  @override
  State<CreateBugScreen> createState() => _CreateBugScreenState();
}

class _CreateBugScreenState extends State<CreateBugScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedProject;
  String? _selectedPriority;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Selection
          const Text(
            'Dự án',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _selectedProject,
            decoration: InputDecoration(
              hintText: 'Chọn dự án',
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
            items: ['Mobile App', 'E-Commerce', 'Website', 'Database']
                .map((project) => DropdownMenuItem(
                      value: project,
                      child: Text(project),
                    ))
                .toList(),
            onChanged: (value) => setState(() => _selectedProject = value),
          ),
          const SizedBox(height: 16),

          // Title
          const Text(
            'Tiêu đề lỗi',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Nhập tiêu đề lỗi...',
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Priority
          const Text(
            'Mức độ ưu tiên',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: _selectedPriority == 'Thấp'
                        ? const Color(0xFF2D9D48)
                        : Colors.transparent,
                    side: BorderSide(
                      color: _selectedPriority == 'Thấp'
                          ? const Color(0xFF2D9D48)
                          : Colors.grey.shade300,
                    ),
                  ),
                  onPressed: () => setState(() => _selectedPriority = 'Thấp'),
                  child: Text(
                    'Thấp',
                    style: TextStyle(
                      color: _selectedPriority == 'Thấp'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: _selectedPriority == 'Cao'
                        ? const Color(0xFF2D9D48)
                        : Colors.transparent,
                    side: BorderSide(
                      color: _selectedPriority == 'Cao'
                          ? const Color(0xFF2D9D48)
                          : Colors.grey.shade300,
                    ),
                  ),
                  onPressed: () => setState(() => _selectedPriority = 'Cao'),
                  child: Text(
                    'Cao',
                    style: TextStyle(
                      color: _selectedPriority == 'Cao'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Description
          const Text(
            'Mô tả chi tiết',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: 'Mô tả các bước để tái tạo lỗi...',
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
            maxLines: 5,
          ),
          const SizedBox(height: 16),

          // File Upload
          const Text(
            'Tập đính kèm',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          DottedBorder(
            color: const Color(0xFF2D9D48),
            child: SizedBox(
              width: double.infinity,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 48,
                    color: const Color(0xFF2D9D48),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tải lên ảnh hoặc video',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'PNG, JPG, MP4 lên tới 10MB',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _titleController.clear();
                    _descriptionController.clear();
                    setState(() {
                      _selectedProject = null;
                      _selectedPriority = null;
                    });
                  },
                  child: const Text('Hủy bỏ'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D9D48),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Báo cáo lỗi đã được gửi!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    _titleController.clear();
                    _descriptionController.clear();
                    setState(() {
                      _selectedProject = null;
                      _selectedPriority = null;
                    });
                  },
                  child: const Text('Gửi báo cáo'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
