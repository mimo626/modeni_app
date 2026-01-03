import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  // 라이트 모드 테마
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        // Primary 색상 (기본 브랜드 색상)
        primary: AppColors.primaryColor, // #BFA288
        onPrimary: AppColors.whiteColor, // 흰색
        
        // Secondary 색상
        secondary: AppColors.secondaryColor, // #EAEAEA
        onSecondary: AppColors.blackColor, // 검정색
        
        // Tertiary 색상
        tertiary: AppColors.tertiaryColor, // #F2F2F2
        onTertiary: AppColors.blackColor, // 검정색
        
        // Error 색상
        error: AppColors.errorColor, // #FC0032
        onError: AppColors.whiteColor,
        
        // Surface 색상 (카드, 다이얼로그 등의 배경)
        surface: AppColors.whiteColor, // #FFFFFF
        onSurface: AppColors.blackColor, // #000000
        
        // Surface Variant 색상 (Surface의 변형)
        surfaceVariant: AppColors.secondaryColor, // #EAEAEA
        onSurfaceVariant: AppColors.darkGreyColor, // #525252
        
        // Background 색상 (화면 전체 배경)
        background: AppColors.whiteColor, // #FFFFFF
        onBackground: AppColors.blackColor, // #000000
        
        // Outline 색상 (경계선)
        outline: AppColors.greyColor, // #9F9F9F
        outlineVariant: AppColors.secondaryColor, // #EAEAEA
        
        // Shadow 및 Scrim
        shadow: AppColors.blackColor.withOpacity(0.1),
        scrim: AppColors.blackColor.withOpacity(0.5),
        
        // Inverse 색상 (반전)
        inverseSurface: AppColors.darkGreyColor, // #525252
        onInverseSurface: AppColors.whiteColor,
        inversePrimary: AppColors.tertiaryColor, // #F2F2F2
        
        // Surface Tint (Material 3에서 Surface에 적용되는 틴트)
        surfaceTint: AppColors.primaryColor.withOpacity(0.05),
      ),
    );
  }

  // 다크 모드 테마
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        // Primary 색상 (유지)
        primary: AppColors.primaryColor, // #BFA288
        onPrimary: AppColors.whiteColor, // 흰색 (유지)
        
        // Secondary 색상
        secondary: AppColors.darkGreyColor, // #525252
        onSecondary: AppColors.whiteColor, // 흰색
        
        // Tertiary 색상
        tertiary: AppColors.greyColor, // #9F9F9F
        onTertiary: AppColors.whiteColor, // 흰색
        
        // Error 색상
        error: AppColors.errorColor, // #FC0032
        onError: AppColors.whiteColor,
        
        // Surface 색상 (다크 모드에서는 어두운 배경)
        surface: AppColors.darkGreyColor, // #525252
        onSurface: AppColors.whiteColor,
        
        // Surface Variant 색상
        surfaceVariant: AppColors.greyColor, // #9F9F9F
        onSurfaceVariant: AppColors.whiteColor.withOpacity(0.7),
        
        // Background 색상
        background: AppColors.darkGreyColor, // #525252
        onBackground: AppColors.whiteColor,
        
        // Outline 색상
        outline: AppColors.greyColor, // #9F9F9F
        outlineVariant: AppColors.greyColor.withOpacity(0.5),
        
        // Shadow 및 Scrim (다크 모드에서는 더 진하게)
        shadow: AppColors.blackColor.withOpacity(0.3),
        scrim: AppColors.blackColor.withOpacity(0.7),
        
        // Inverse 색상
        inverseSurface: AppColors.whiteColor,
        onInverseSurface: AppColors.darkGreyColor, // #525252
        inversePrimary: AppColors.primaryColor.withOpacity(0.8),
        
        // Surface Tint
        surfaceTint: AppColors.primaryColor.withOpacity(0.1),
      ),
    );
  }
}


