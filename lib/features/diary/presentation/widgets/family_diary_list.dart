// import 'package:flutter/material.dart';
// import '../../../../core/theme/colors.dart';
// import '../../../../core/theme/padding.dart';
// import '../../../../core/theme/sizedbox.dart';
// import '../../../../core/theme/text_styles.dart';
//
//
// class DiaryFamily {
//   final List<String> emotionList;
//   final List<String> todoList;
//   final String input;
//
//   DiaryFamily({required this.emotionList, required this.todoList, required this.input});
// }
// class FamilyAnswerList extends StatelessWidget {
//   const FamilyAnswerList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final members = [
//       DiaryFamily(emotionList: ["뿌듯함", "기쁨"], todoList: ["요리하기", "산책하기"], input: ""),
//       DiaryFamily(emotionList: ["행복", "설렘"], todoList: ["책 읽기", "카페가기"], input: "맛난 거 먹고 행복하다."),
//     ];
//
//     return Column(
//       children: members.map((member) => FamilyDiaryCard(member: member)).toList(),
//     );
//   }
// }
//
// class FamilyDiaryCard extends StatelessWidget {
//   final DiaryFamily member;
//
//   const FamilyDiaryCard({super.key, required this.member});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: AppPadding.bottom12Padding,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             padding: AppPadding.all20Padding,
//             decoration: BoxDecoration(
//                 color: AppColors.whiteColor,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: AppColors.primaryColor)
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Column(
//                       children: [
//                         Image.asset(member.imgUrl, scale: 6,),
//                         AppSizedBox.h4SizedBox,
//                         Text(member.name, style: AppTextStyles.medium14),
//                       ],
//                     ),
//                     AppSizedBox.w16SizedBox,
//                     Expanded(
//                       child: Text(member.answer, style: AppTextStyles.medium14,
//                         softWrap: true,
//                         overflow: TextOverflow.visible,),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {},
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.zero,
//                 backgroundColor: AppColors.primaryColor,
//                 foregroundColor: AppColors.primaryColor,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//               ),
//               child: Text("👍️ ${member.heartCount}", style: AppTextStyles.medium16.copyWith(color: AppColors.whiteColor),),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }