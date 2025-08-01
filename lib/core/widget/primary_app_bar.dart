import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/colors.dart';
import '../theme/padding.dart';
import '../theme/text_styles.dart';

class PrimaryAppbar extends StatefulWidget implements PreferredSizeWidget {
  final bool isLeadingButtonExist;
  final String? leadingButtonIcon;
  final VoidCallback? leadingButtonPressed;
  final String? title;
  final bool showNotificationIcon;
  final bool showSettingIcon;
  final bool showSearchIcon;
  final bool showLogo;
  final bool isDivider;

  const PrimaryAppbar({
    super.key,
    this.isLeadingButtonExist = false,
    this.leadingButtonIcon,
    this.leadingButtonPressed,
    this.title,
    this.showNotificationIcon = false,
    this.showSettingIcon = false,
    this.showSearchIcon = false,
    this.showLogo = false,
    this.isDivider = false,
  });

  @override
  State<PrimaryAppbar> createState() => _PrimaryAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _PrimaryAppbarState extends State<PrimaryAppbar> {
  double titleSpacing = 12.0;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 44.0,
          scrolledUnderElevation: 0,
          leading: widget.isLeadingButtonExist
              ? Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(
                  widget.leadingButtonIcon!,
                  width: 24,
                  height: 24,
                ),
                onPressed: widget.leadingButtonPressed,
              ),
            ),
          )
              : null,
          title: getTitleWidget(),
          centerTitle: true,
          actions: [
            if (widget.showSearchIcon)
              Padding(
                padding: AppPadding.right8Padding,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'lib/core/icons/search.svg',
                      width: 22,
                      height: 22,
                      color: AppColors.blackColor,
                    ),
                    onPressed: () {
                      context.push("/search");
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            if (widget.showSettingIcon)
              Padding(
                padding: AppPadding.right8Padding,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'lib/core/icons/setting.svg',
                      width: 24,
                      height: 24,
                      color: AppColors.greyColor,
                    ),
                    onPressed: () {
                      context.push("/settings");
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            if (widget.showNotificationIcon)
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'lib/core/icons/bell.svg',
                    width: 24,
                    height: 24,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    context.push("/alarm");
                  },
                  padding: EdgeInsets.zero,
                ),
              ),
          ],
        ),
        if (widget.isDivider)
          const Divider(
            height: 1,
            color: AppColors.lightGreyColor,
          ),
      ],
    );
  }

  Widget? getTitleWidget() {
    if (widget.title != null) {
      titleSpacing = 8;
      return Text(
        widget.title!,
        style: AppTextStyles.semiBold18,
        textAlign: TextAlign.center,
      );
    } else if (widget.showLogo) {
      return SvgPicture.asset('lib/core/icons/app_logo.svg');
    } else {
      return null;
    }
  }
}
