import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final Widget? leadingWidget;
  final VoidCallback? onBackPressed;
  final bool centerTitle;
  final double elevation;
  final Widget? titleWidget;

  const AppBarWidget({
    super.key,
    this.title = '',
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.leadingWidget,
    this.onBackPressed,
    this.centerTitle = true,
    this.elevation = 1,
    this.titleWidget,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton,
      leading: _buildLeading(context),
      title: titleWidget ??
          Text(
            title,
            style: TextStyle(
              color: titleColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
      actions: actions,
    );
  }

  Widget? _buildLeading(BuildContext context) {
    if (!showBackButton) return null;

    if (leadingWidget != null) return leadingWidget;

    return IconButton(
      padding: EdgeInsets.only(left: 4.w),
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: Colors.white,
      ),
      onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
