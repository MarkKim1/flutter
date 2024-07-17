import 'package:flutter/material.dart';
import 'main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'searchBar.dart';

class favoritePage extends StatefulWidget {
  const favoritePage({Key? key}) : super(key: key);

  @override
  State<favoritePage> createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  late List<Map<String, dynamic>> favoriteList = [];

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    try {
      final response =
          await supabase.from('favorite').select().eq('id', fetchedIdOutside);
      if (response.isNotEmpty) {
        setState(() {
          favoriteList = response;
        });
      }
    } on PostgrestException catch (error) {
      debugPrint('error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: searchBarDesign(context),
          ),
          Expanded(
            child: favoriteList.isEmpty
                ? Center(
                    child: Text(
                      'Nothing is added to favorite',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      final item = favoriteList[index];
                      return ListTile(
                        title: Text(item['clicked_sub_category']),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EachSubCategoryPage(
                                    clickedSubCategory:
                                        item['clicked_sub_category']),
                              ));
                        },
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
