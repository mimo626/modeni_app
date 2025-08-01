import 'package:flutter/material.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("미션", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 성향 카드
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text("🫧"), // 또는 Image.asset('assets/blue.png')
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: '나는 ',
                            children: [
                              TextSpan(
                                text: '파랑이',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                              const TextSpan(text: ' 성향입니다.'),
                            ],
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("성향 테스트 다시하기"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 궁합
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("우리 가족과 궁합 알아보기",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Expanded(child: _FamilyCompatibilityCard(name: "아빠", type: "남색이")),
                      SizedBox(width: 12),
                      Expanded(child: _FamilyCompatibilityCard(name: "엄마", type: "노랑이")),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 미션 카드
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 60,
                    height: 80,
                    child: Stack(
                      children: [
                        Positioned(left: 12, child: Card(child: SizedBox(width: 40, height: 60))),
                        Positioned(left: 0, child: Card(child: SizedBox(width: 40, height: 60))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("성공한 미션카드", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("01개", style: TextStyle(color: Colors.green, fontSize: 24)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("미션 카드 확인 하러가기"),
              ),
            ),
            const SizedBox(height: 20),

            // 복지 정보
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                ),
                child: Row(
                  children: const [
                    Expanded(child: Text("우리 가족을 위한 복지 정보")),
                    Icon(Icons.arrow_forward_ios, size: 18),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FamilyCompatibilityCard extends StatelessWidget {
  final String name;
  final String type;

  const _FamilyCompatibilityCard({required this.name, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade100),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Text("🫧", style: TextStyle(fontSize: 24)), // 이모티콘 또는 이미지로 대체
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(type),
          ),
          const SizedBox(height: 4),
          const Text("??? %", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
