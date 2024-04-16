import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isArrowIcon;
  final String title;
  final VoidCallback onPressed;
  const AppBarWidget({super.key, required this.title, required this.onPressed, required this.isArrowIcon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: size.width * 0.2),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            isArrowIcon? IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: onPressed,
            ): const SizedBox(),
          ],
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
