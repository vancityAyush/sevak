import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sevak/models/User.dart';
import 'package:sevak/screens/chat_screen.dart';
import 'package:sevak/utils/constants.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          ChatScreen(
            user: currentUser,
          ),
          transition: Transition.cupertino,
        );
      },
      leading: Image(
        image: currentUser.profileImage,
      ),
      title: Text(
        currentUser.name,
        style: TEXT_THEME_DEFAULT.headline5,
      ),
      subtitle: Text(
        currentUser.lastMessage,
        maxLines: 1,
        style: TEXT_THEME_DEFAULT.bodyText2,
      ),
      trailing: Text(
        currentUser.lastSeenTime,
        style: TEXT_THEME_DEFAULT.bodyText2,
      ),
    );
  }
}
