import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.backButtonCallback,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.title,
  });

  final VoidCallback? backButtonCallback;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(title ?? "", style: TextStyle(color: Colors.black),),
        leading: GestureDetector(
          onTap: backButtonCallback ?? () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: leading ??
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
          ),
        ),
        actions: actions
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(92);
}
