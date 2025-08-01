import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("일기", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // 날짜 선택
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(8, (index) {
                  final day = index + 1;
                  final isToday = day == 8;
                  final isSelected = day == 2;
                  return isToday
                      ? CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green.shade300,
                    child: Text('$day', style: const TextStyle(color: Colors.white)),
                  )
                      : Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: isSelected ? Colors.green : Colors.transparent),
                      shape: BoxShape.circle,
                    ),
                    child: Text('$day'),
                  );
                }),
              ),
            ),
            const SizedBox(height: 8),
            const Icon(Icons.expand_more),

            const SizedBox(height: 12),
            // 작성하기 버튼
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () => context.push("/diary_write"),
                child: const Text("작성하기", style: TextStyle(color: Colors.white)),
              ),
            ),
            const Divider(height: 32),

            // 가족 구성원들
            const DiaryItemRow(name: "아빠", tags: ["뿌듯함", "행복", "산책하기"]),
            const SizedBox(height: 16),
            const DiaryItemRow(name: "엄마", tags: ["뿌듯함", "행복", "산책하기"]),
          ],
        ),
      ),
    );
  }
}

class DiaryItemRow extends StatelessWidget {
  final String name;
  final List<String> tags;

  const DiaryItemRow({super.key, required this.name, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: tags.map((tag) => _KeywordChip(tag: tag)).toList(),
        ),
        const Divider(height: 32),
      ],
    );
  }
}

class _KeywordChip extends StatelessWidget {
  final String tag;

  const _KeywordChip({required this.tag});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (tag == "뿌듯함") {
      bgColor = Colors.green.shade100;
    } else if (tag == "행복") {
      bgColor = Colors.pink.shade100;
    } else {
      bgColor = Colors.blue.shade100;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(tag),
    );
  }
}
