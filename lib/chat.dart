import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart';
import 'main.dart';

const preloader = Center(child: CircularProgressIndicator(color: Colors.blue,),);
const formSpacer = SizedBox(width: 16, height: 16);
const formPadding = EdgeInsets.symmetric(vertical: 20, horizontal: 16);
const unexpectedErrorMessage = 'Unexpected Error occurred';
final appTheme = ThemeData.light().copyWith(
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
    focusColor: Colors.blue,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
  ),
);

extension ShowSnackBar on BuildContext{
  void showSnackBar({
    required String message,
    Color backGroundColor = Colors.white,
}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backGroundColor,
    ));
  }
  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backGroundColor: Colors.red);
  }
}

class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
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

class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  /// User ID of the profile
  final String id;

  /// username of the profile
  final String username;

  /// date and time when the profile was created
  final DateTime createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        createdAt = DateTime.parse(map['created_at']);
}

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final Stream<List<Message>> _messagesStream;
  final Map<String, Profile> _profileCache = {};

  @override
  void initState() {
    super.initState();
    _initializeMessagesStream();
  }

  void _initializeMessagesStream() async {
    final myUserId = userInputId;
    _messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps
        .map((map) => Message.fromMap(map: map, myUserId: myUserId))
        .toList());
    setState(() {}); // Trigger rebuild to update the stream
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
      body: StreamBuilder<List<Message>>(
        stream: _messagesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: messages.isEmpty
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
                  ),
                ),
                const _MessageBar(),
              ],
            );
          } else {
            return preloader;
          }
        },
      ),
    );
  }
}

class _MessageBar extends StatefulWidget {
  const _MessageBar({Key? key}) : super(key: key);
  
  @override
  State<_MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<_MessageBar> {
  late final TextEditingController _textController;

  @override
  Widget build(BuildContext context){
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
                onPressed: () => _submitMessage(),
                child: const Text('Send'),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  void _submitMessage() async {
    final text = _textController.text;
    final myUserId = userInputId;
    if(text.isEmpty){
      return;
    }
    _textController.clear();
    try {
      await supabase.from('messages').insert({
        'id' : myUserId,
        'content' : text,
      });
    } on PostgrestException catch(error) {
      context.showErrorSnackBar(message: error.message);
    } catch(_){
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble ({
    Key? key,
    required this.message,
    required this.profile,
  }) : super(key: key);
  final Message message;
  final Profile? profile;

  @override
  Widget build(BuildContext context){
    List<Widget> chatContents = [
      if(!message.isMine)
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
      const SizedBox(width: 12,),
      Text(format(message.createdAt, locale: 'en_short')),
      const SizedBox(width: 60,),
    ];
    if(message.isMine) {
      chatContents = chatContents.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment: message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}


