import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final List<String> users;

  const UserAvatar({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return users.map((user) {
          return PopupMenuItem(
            value: user,
            child: Text(user),
          );
        }).toList();
      },
    );
  }
}