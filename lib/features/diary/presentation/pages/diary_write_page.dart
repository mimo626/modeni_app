import 'package:flutter/material.dart';
import 'package:modeni_app/core/theme/colors.dart';

class DiaryWritePage extends StatefulWidget {
  const DiaryWritePage({super.key});

  @override
  State<DiaryWritePage> createState() => _DiaryWritePageState();
}

class _DiaryWritePageState extends State<DiaryWritePage> {
  final TextEditingController _controller = TextEditingController();

  List<String> emotions = ['뿌듯함', '행복', '행복', '행복', '행복', '행복', '행복', '행복',];
  List<String> todos = ['산책하기', '요리하기', '요리하기', '산책하기', '요리하기', '요리하기', '산책하기', '요리하기', '요리하기'];

  Set<String> selectedEmotions = {};
  Set<String> selectedTodos = {};

  void _toggleEmotion(String emotion) {
    setState(() {
      if (selectedEmotions.contains(emotion)) {
        selectedEmotions.remove(emotion);
      } else if (selectedEmotions.length < 2) {
        selectedEmotions.add(emotion);
      }
    });
  }

  void _toggleTodo(String todo) {
    setState(() {
      if (selectedTodos.contains(todo)) {
        selectedTodos.remove(todo);
      } else if (selectedTodos.length < 2) {
        selectedTodos.add(todo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const Icon(Icons.close),
        title: const Text("일기 작성", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("오늘의 감정", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("키워드를 1-2개 선택해 주세요.", style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: emotions.map((e) {
                  final isSelected = selectedEmotions.contains(e);
                  return ChoiceChip(
                    label: Text(e),
                    selected: isSelected,
                    selectedColor: Colors.green.shade100,
                    onSelected: (_) => _toggleEmotion(e),
                    shape: StadiumBorder(side: BorderSide(color: isSelected ? Colors.green : Colors.grey)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const Text("오늘 하고 싶은 일", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("키워드를 1-2개 선택해 주세요.", style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: todos.map((t) {
                  final isSelected = selectedTodos.contains(t);
                  return ChoiceChip(
                    label: Text(t),
                    selected: isSelected,
                    selectedColor: Colors.orange.shade100,
                    onSelected: (_) => _toggleTodo(t),
                    shape: StadiumBorder(side: BorderSide(color: isSelected ? Colors.orange : Colors.grey)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              const Text("직접 입력", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("못다한 말을 직접 적어보세요.", style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green.shade100),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _controller,
                  maxLength: 50,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: '50자 이내 입력',
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () {
                    // 작성 완료 처리
                  },
                  child: const Text("작성하기", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
