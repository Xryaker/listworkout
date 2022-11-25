import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar(String title, {super.key}) {
    // ignore: unnecessary_this
    this.preferredSize = const Size.fromHeight(kToolbarHeight);
    // ignore: prefer_initializing_formals
    this.title = title;
  }
  @override
  late final Size preferredSize; // default is 56.0
  late final String title;
  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final Color color = const Color.fromARGB(102, 1, 5, 16);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: color,
      centerTitle: true,
    );
  }
}
