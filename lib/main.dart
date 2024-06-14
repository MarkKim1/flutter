import 'package:flutter/material.dart';
import 'EachCategoryTemplate.dart';
import 'category.dart';
import 'utils.dart';
import 'package:url_launcher/url_launcher.dart';

List<Category> categories = Utils.getMockedCategories();

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
          body: Center(),
        ),
      ),
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
                  title: Text(categories[mainIndex].subCategories[index],
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
                          child: Text(item["error"]!),
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
                    width: double.infinity, // Make the container as wide as the parent
                    child: TextButton(
                      onPressed: () {
                        final uri = Uri.parse(item["videoUrl"]!);
                        _launchURL(uri);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0), // Add vertical padding
                        backgroundColor: Colors.blue, // Set button background color
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


