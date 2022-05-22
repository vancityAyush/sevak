import 'package:flutter/material.dart';
import 'package:sevak/models/User.dart';
import 'package:sevak/models/message.dart';
import 'package:sevak/utils/constants.dart';
import 'package:sevak/utils/sample_data.dart';
import 'package:sevak/widgets/chat_tile.dart';

class ChatHomeScreen extends StatelessWidget {
  ChatHomeScreen({Key? key}) : super(key: key);

  List<User> users = [
    for (String item in sample_users)
      User(
        profileImage: const NetworkImage(
            "https://www.computerhope.com/issues/pictures/win10-user-account-default-picture.png"),
        name: item,
        lastSeen: DateTime.now(),
        messages: [
          for (int i = 0; i < 5; i++)
            Message(
              data: 'Hello, how are you?',
              timestamp: DateTime.now(),
              isMe: i % 2 == 0 ? true : false,
            ),
          ...sample_messages,
          Message(data: "HI $item!", timestamp: DateTime.now())
        ],
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: COLOR_PURPLE_DARK,
          leading: IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            onPressed: () {},
          ),
          title: const Text(
            'Chat',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: ChatSearchDelegate(users));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            User currentUser = users[index];
            return ChatTile(currentUser: currentUser);
          },
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 2,
              indent: 80,
              endIndent: 10,
            );
          },
        ),
      ),
    );
  }
}

class ChatSearchDelegate extends SearchDelegate {
  final List<User> originalUsers;

  ChatSearchDelegate(this.originalUsers);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<User> matchQuery = [];
    for (User user in originalUsers) {
      if (user.doesHave(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) => ChatTile(currentUser: matchQuery[index]),
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<User> matchQuery = [];
    for (User user in originalUsers) {
      if (user.doesHave(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) => ChatTile(currentUser: matchQuery[index]),
      itemCount: matchQuery.length,
    );
  }
}
