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
        primary: AppColors.primaryColor, // #8CC67D
        onPrimary: Colors.white,
        
        // Secondary 색상
        secondary: AppColors.secondaryColor, // #E4F6E0
        onSecondary: AppColors.darkGreyColor, // #3D3D3D
        
        // Tertiary 색상
        tertiary: AppColors.tertiaryColor, // #C0E0B9
        onTertiary: AppColors.blackGreyColor, // #2F2F2F
        
        // Error 색상
        error: AppColors.redColor, // #FC0032
        onError: Colors.white,
        
        // Surface 색상 (카드, 다이얼로그 등의 배경)
        surface: AppColors.whiteColor, // #FFFFFF
        onSurface: AppColors.blackColor, // #000000
        
        // Surface Variant 색상 (Surface의 변형)
        surfaceVariant: AppColors.lightGreyColor, // #EEF1F4
        onSurfaceVariant: AppColors.darkGreyColor, // #3D3D3D
        
        // Background 색상 (화면 전체 배경)
        background: AppColors.whiteColor, // #FFFFFF
        onBackground: AppColors.blackColor, // #000000
        
        // Outline 색상 (경계선)
        outline: AppColors.greyColor, // #9BA5B7
        outlineVariant: AppColors.lightGreyColor, // #EEF1F4
        
        // Shadow 및 Scrim
        shadow: Colors.black.withOpacity(0.1),
        scrim: Colors.black.withOpacity(0.5),
        
        // Inverse 색상 (반전)
        inverseSurface: AppColors.blackGreyColor, // #2F2F2F
        onInverseSurface: Colors.white,
        inversePrimary: AppColors.tertiaryColor, // #C0E0B9
        
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
        // Primary 색상 (다크 모드에서는 좀 더 밝게)
        primary: AppColors.primaryColor, // #8CC67D
        onPrimary: AppColors.blackGreyColor, // #2F2F2F
        
        // Secondary 색상 (다크 모드에서는 좀 더 어둡게)
        secondary: AppColors.tertiaryColor.withOpacity(0.3), // #C0E0B9 (투명도 적용)
        onSecondary: Colors.white,
        
        // Tertiary 색상
        tertiary: AppColors.secondaryColor.withOpacity(0.2), // #E4F6E0 (투명도 적용)
        onTertiary: Colors.white,
        
        // Error 색상
        error: AppColors.redColor, // #FC0032
        onError: Colors.white,
        
        // Surface 색상 (다크 모드에서는 어두운 배경)
        surface: AppColors.blackGreyColor, // #2F2F2F
        onSurface: Colors.white,
        
        // Surface Variant 색상
        surfaceVariant: AppColors.darkGreyColor, // #3D3D3D
        onSurfaceVariant: Colors.white70,
        
        // Background 색상
        background: AppColors.blackGreyColor, // #2F2F2F
        onBackground: Colors.white,
        
        // Outline 색상
        outline: AppColors.greyColor, // #9BA5B7
        outlineVariant: AppColors.darkGreyColor.withOpacity(0.5), // #3D3D3D (투명도 적용)
        
        // Shadow 및 Scrim (다크 모드에서는 더 진하게)
        shadow: Colors.black.withOpacity(0.3),
        scrim: Colors.black.withOpacity(0.7),
        
        // Inverse 색상
        inverseSurface: Colors.white,
        onInverseSurface: AppColors.blackGreyColor, // #2F2F2F
        inversePrimary: AppColors.primaryColor.withOpacity(0.8),
        
        // Surface Tint
        surfaceTint: AppColors.primaryColor.withOpacity(0.1),
      ),
    );
  }
}

