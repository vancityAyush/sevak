import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:get/get.dart';
import 'package:sevak/models/User.dart';
import 'package:sevak/models/message.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/format.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  final TextEditingController messageController = TextEditingController();
  ScrollController _controller = ScrollController();
  ChatScreen({Key? key, required this.user}) : super(key: key);

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: COLOR_PURPLE_DARK,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Chat With ${user.name}'),
              Text(
                user.lastSeenString,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(image: user.profileImage),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.separated(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Message currentMessage =
                        user.messagesController.value[index];
                    return ChatBubble(
                      elevation: 0,
                      backGroundColor: COLOR_PURPLE_DARK,
                      alignment: Alignment.centerRight,
                      clipper: ChatBubbleClipper4(
                        type: currentMessage.isMe
                            ? BubbleType.sendBubble
                            : BubbleType.receiverBubble,
                        nipSize: 10,
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: Text(
                          currentMessage.data,
                          textAlign: currentMessage.isMe
                              ? TextAlign.right
                              : TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: user.messagesController.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                    child: Text(
                      formatTime(
                        user.messagesController.value[index].timestamp,
                      ),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              color: COLOR_GREY,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: const CircleBorder(),
                    color: COLOR_PURPLE_DARK,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      user.sendMessage(messageController.text);
                      messageController.clear();
                      _scrollDown();
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
