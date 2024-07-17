// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'board_page.dart';
//
// class BoardListPage extends StatefulWidget {
//   @override
//   _BoardListPageState createState() => _BoardListPageState();
// }
//
// class _BoardListPageState extends State<BoardListPage> {
//   List<Map<String, dynamic>> boards = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadBoards();
//   }
//
//   Future<void> _loadBoards() async {
//     try {
//       final response = await Supabase.instance.client.from('boards').select();
//       if (response.error != null) {
//         throw response.error!;
//       }
//       setState(() {
//         boards = List<Map<String, dynamic>>.from(response);
//       });
//     } catch (error) {
//       final snackBar = SnackBar(content: Text('Error: ${error.toString()}'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
//
//   Future<void> _addBoard(String boardName) async {
//     try {
//       final response = await Supabase.instance.client
//           .from('boards')
//           .insert({'name': boardName});
//       if (response.error != null) {
//         throw response.error!;
//       }
//       _loadBoards();
//     } catch (error) {
//       final snackBar = SnackBar(content: Text('Error: ${error.toString()}'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Boards'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   String boardName = '';
//                   return AlertDialog(
//                     title: Text('New Board'),
//                     content: TextField(
//                       onChanged: (value) {
//                         boardName = value;
//                       },
//                       decoration: InputDecoration(labelText: 'Board Name'),
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           if (boardName.isNotEmpty) {
//                             _addBoard(boardName);
//                             Navigator.pop(context);
//                           }
//                         },
//                         child: Text('Add'),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: boards.length,
//         itemBuilder: (context, index) {
//           final board = boards[index];
//           return ListTile(
//             title: Text(board['name']),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       BoardPage(boardId: board['id'], boardName: board['name']),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
