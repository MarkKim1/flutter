import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart';
import 'dart:async';

final supabase = Supabase.instance.client;

const preloader = Center(child: CircularProgressIndicator(color: Colors.blue,));

const formSpacer = SizedBox(width: 16, height: 16,);

const formPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 16);

const unexpectedErrorMessage = 'Unexpected error occurred';

final appTheme = ThemeData.light().copyWith(
    primaryColorDark: Colors.blue,
    appBarTheme: const AppBarTheme(
      elevation: 1,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    primaryColor: Colors.blue,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(
        color: Colors.blue,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
    )
);

extension ShowSnackBar on BuildContext {
  /// Displays a basic snackBar
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  /// Displays a red snackBar indicating error
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  final String id;
  final String username;
  final DateTime createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = DateTime.parse(map['created_at']);
}

class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  final String id;
  final String profileId;
  final String content;
  final DateTime createdAt;
  final bool isMine;

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        profileId = map['profile_id'],
        content = map['content'],
        createdAt = DateTime.parse(map['created_at']),
        isMine = myUserId == map['profile_id'];
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final Stream<List<Message>> _messagesStream;
  final Map<String, Profile> _profileCache = {};

  @override
  void initState() {
    final myUserId = supabase.auth.currentUser!.id;
    _messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps
        .map((map) => Message.fromMap(map: map, myUserId: myUserId))
        .toList());
    super.initState();
  }

  Future<void> _loadProfileCache(String profileId) async {
    if (_profileCache[profileId] != null) {
      return;
    }
    final data =
    await supabase.from('profiles').select().eq('id', profileId).single();
    final profile = Profile.fromMap(data);
    setState(() {
      _profileCache[profileId] = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _messagesStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!;
                  return messages.isEmpty
                      ? const Center(
                    child: Text('Start your conversation now :)'),
                  )
                      : ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      _loadProfileCache(message.profileId);

                      return _ChatBubble(
                        message: message,
                        profile: _profileCache[message.profileId],
                      );
                    },
                  );
                } else {
                  return preloader;
                }
              },
            ),
          ),
          const _MessageBar(),
        ],
      ),
    );
  }
}

class _MessageBar extends StatefulWidget {
  const _MessageBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<_MessageBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  autofocus: true,
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              TextButton(
                onPressed: _submitMessage,
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitMessage() async {
    final text = _textController.text;
    final myUserId = supabase.auth.currentUser!.id;
    if (text.isEmpty) {
      return;
    }
    _textController.clear();
    try {
      await supabase.from('messages').insert({
        'profile_id': myUserId,
        'content': text,
      });
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    Key? key,
    required this.message,
    required this.profile,
  }) : super(key: key);

  final Message message;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    List<Widget> chatContents = [
      if (!message.isMine)
        CircleAvatar(
          child: profile == null
              ? preloader
              : Text(profile!.username.substring(0, 2)),
        ),
      const SizedBox(width: 12),
      Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: message.isMine
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message.content),
        ),
      ),
      const SizedBox(width: 12),
      Text(format(message.createdAt, locale: 'en_short')),
      const SizedBox(width: 60),
    ];
    if (message.isMine) {
      chatContents = chatContents.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment:
        message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}
