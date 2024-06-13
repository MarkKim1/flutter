import 'package:flutter/material.dart';
import 'EachCategoryTemplate.dart';
import 'category.dart';
import 'utils.dart';
import 'package:url_launcher/url_launcher.dart'; // url 가져오는 페키지

List<Category> categories = Utils.getMockedCategories();
Map<String, List<Category>>? mainCategory;
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
  String ImgLink = "image/logo.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        // Wrap Scaffold with SafeArea
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.menu,
                  size: 35,
                ),
                tooltip: '메뉴화면',
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/setting');
                },
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  tooltip: '세팅 화면',
                ),
              ),
            ],
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  ImgLink,
                  height: 50,
                ),
                SizedBox(width: 10),
                Text(
                  'Trouble Shoot Manual',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          body: Center(),
        ),
      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
              'trouble shoot categories',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return EachCategoryTemplate(
                    // returns the Container
                    name: categories[index].name,
                    imgName: categories[index].imgName,
                    describe: categories[index].describe);
              },
            ),
          )
        ],
      ),
    );
  }
}

class eachCategoryView extends StatefulWidget {
  // 메뉴 화면 클릭하면 나오는 화면
  final String categoryName;

  eachCategoryView({required this.categoryName});
  @override
  State<eachCategoryView> createState() => _eachCategoryViewState();
}

class _eachCategoryViewState extends State<eachCategoryView> {
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
                    categories[mainIndex].subCategories[index],
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EachSubCategoryPage(
                            clickedSubCategory:
                                categories[mainIndex].subCategories[index]),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
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
  // 카테고리 클릭했을때 나오는 화면
  final String clickedSubCategory;

  EachSubCategoryPage({required this.clickedSubCategory});

  @override
  State<EachSubCategoryPage> createState() => _EachSubCategoryPageState();
}

class _EachSubCategoryPageState extends State<EachSubCategoryPage> {
  final List<Map<String, String>> errorSolutionList = [
    {
      "error": "Ribbon Out Error",
      "solution": "watch a video",
      "videoUrl": "https://www.youtube.com/watch?v=Hu5Sf5cW_Ws"
    },
    {
      "error": "123 2",
      "solution": "Solution 2",
      "videoUrl": "https://www.youtube.com/watch?v=example2"
    },
    // Add more errors and solutions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.clickedSubCategory)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: errorSolutionList.map((item) {
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
                  TextButton(
                    onPressed: () {
                      final uri = Uri.parse(item["videoUrl"]!);
                      _launchURL(uri);
                    },
                    child: Text('Watch Video'),
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
