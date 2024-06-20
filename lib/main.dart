import 'package:flutter/material.dart';
import 'EachCategoryTemplate.dart';
import 'category.dart';
import 'utils.dart';
import 'package:url_launcher/url_launcher.dart';

List<Category> categories = Utils.getMockedCategories();
List<String> searchTerms = [
  'ZD411: When Label is Not Printing Properly',
  'ZD411: How to Change the darkness of printer',
  'ZD411: How to Perform a Manual Width Adjustment',
  'ZD411: How to Factory reset the ZD411',
  'ZD411: Printer Setup',
  'ZD411: How to Replace the PrintHead'
];
List<String> recentlySearched = [];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/setting': (context) => SettingPage(),
        '/menu': (context) => MenuPage(),
      },
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String imgLink = "image/logo.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu, size: 35),
              tooltip: '메뉴화면',
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings, size: 35),
                tooltip: '세팅 화면',
                onPressed: () {
                  Navigator.pushNamed(context, '/setting');
                },
              ),
            ],
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  imgLink,
                  height: 50,
                ),
                SizedBox(width: 10),
                Text(
                  'Trouble Shoot Manual',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24.0)
                    ),
                    child: Row(
                        children: <Widget> [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            'Search For Troubleshoot...',
                            style: TextStyle(color: Colors.grey),
                          )
                        ]
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var term in searchTerms) {
      if (term.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(term);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            recentlySearched.add(result);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EachSubCategoryPage(
                  clickedSubCategory: result,
                ),
              ),
            );
          },
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: recentlySearched.length,
      itemBuilder: (context, index) {
        var result = recentlySearched[index];
        return ListTile(
          title: Text(result),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              recentlySearched.removeAt(index);
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EachSubCategoryPage(
                  clickedSubCategory: result,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text('Menu'),
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Trouble Shoot Categories',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return EachCategoryTemplate(
                  name: categories[index].name,
                  imgName: categories[index].imgName,
                  describe: categories[index].describe,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EachCategoryView extends StatefulWidget {
  final String categoryName;

  EachCategoryView({required this.categoryName});
  @override
  State<EachCategoryView> createState() => _EachCategoryViewState();
}

class _EachCategoryViewState extends State<EachCategoryView> {
  late int mainIndex;

  @override
  void initState() {
    super.initState();
    mainIndex =
        categories.indexWhere((item) => item.name == widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categories[mainIndex].describe),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: categories[mainIndex].subCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(
                    getStringAfterFirstSpace(
                        categories[mainIndex].subCategories[index]),
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EachSubCategoryPage(
                          clickedSubCategory:
                              categories[mainIndex].subCategories[index],
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.blue,
                  indent: 16,
                  endIndent: 16,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EachSubCategoryPage extends StatefulWidget {
  final String clickedSubCategory;

  EachSubCategoryPage({required this.clickedSubCategory});

  @override
  State<EachSubCategoryPage> createState() => _EachSubCategoryPageState();
}

class _EachSubCategoryPageState extends State<EachSubCategoryPage> {
  late List<Map<String, String>> filteredErrorSolutionList;

  @override
  void initState() {
    super.initState();
    int index = categories.indexWhere(
        (item) => item.subCategories.contains(widget.clickedSubCategory));
    filteredErrorSolutionList = categories[index]
        .troubleShootDescribe!
        .where((item) => item["error"] == widget.clickedSubCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.clickedSubCategory)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: filteredErrorSolutionList.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Solution',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text(getStringAfterFirstSpace(item["error"]!)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item["solution"]!),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (item["videoUrl"]!.isNotEmpty)
                    Container(
                      width: double
                          .infinity, // Make the container as wide as the parent
                      child: TextButton(
                        onPressed: () {
                          final uri = Uri.parse(item["videoUrl"]!);
                          _launchURL(uri);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0), // Add vertical padding
                          backgroundColor:
                              Colors.blue, // Set button background color
                        ),
                        child: Text(
                          'Watch Video',
                          style: TextStyle(
                            color: Colors.white, // Set text color
                            fontSize: 16.0, // Set text size
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

String getStringAfterFirstSpace(String key) {
  String value = key;

  //split the string by spaces
  List<String> parts = value.split(' ');

  //check if there are more than one part
  if (parts.length > 1) {
    return parts.sublist(1).join(' ');
  } else {
    return "";
  }
}
