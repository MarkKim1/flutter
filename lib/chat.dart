import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart';
import 'main.dart';

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
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final Stream<List<Message>> _messagesStream;
  final Map<String, Profile> _profileCache = {};

  @override
  void initState() async {
    final myUserId = userInputId;
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
    if(_profileCache[profileId] != null){
      return;
    }
    final data = await supabase.from('profiles').select().eq('id', profileId).single();
    final profile = Profile.fromMap(data);
    setState(() {
      _profileCache[profileId] = profile;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<List<Message>>(
        stream: _messagesStream,
        builder: (context, snapshot){
          if(snapshot.hasData){
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
                    itemBuilder: (context, index){
                      final message = messages[index];
                      _loadProfileCache(message.profileId);
                      return Scaffold(
                        // message: message,
                        // profile: _profileCache[message.profileId],
                      );
                    },
                  ),
                ),
                const _MessageBar(),
              ],
            );
          } else{
            return Scaffold();
          }
        }
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
  late final TextEditingController _textController;

  @override
  Widget build(BuildContext context){
    return Material(

    );
  }
}

