import 'package:flutter/material.dart';
import '../models/bug.dart';
import '../services/mock_data.dart';
import '../widgets/bug_item_card.dart';
import 'bug_detail_screen.dart';

class BugListScreen extends StatefulWidget {
  const BugListScreen({Key? key}) : super(key: key);

  @override
  State<BugListScreen> createState() => _BugListScreenState();
}

class _BugListScreenState extends State<BugListScreen> {
  String _selectedFilter = 'Tất cả';

  final List<String> _filters = [
    'Tất cả',
    'Mới',
    'Đang xử lý',
    'Đã sửa',
  ];

  @override
  Widget build(BuildContext context) {
    final allBugs = MockData.bugs;
    List<Bug> filteredBugs = allBugs;
    
    if (_selectedFilter != 'Tất cả') {
      filteredBugs = allBugs.where((bug) => bug.status == _selectedFilter).toList();
    }

    return Column(
      children: [
        // Search & Filter
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm lỗi...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2D9D48),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.tune, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),

        // Filter Chips
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _filters.map((filter) {
                bool isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => _selectedFilter = filter);
                    },
                    backgroundColor: Colors.grey.shade200,
                    selectedColor: const Color(0xFF2D9D48),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Bug List
        Expanded(
          child: filteredBugs.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox_outlined,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Không có lỗi',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: filteredBugs.length,
                  itemBuilder: (context, index) {
                    return BugItemCard(
                      bug: filteredBugs[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BugDetailScreen(bug: filteredBugs[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
