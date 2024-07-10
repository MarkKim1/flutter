import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:name_app/searchBar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'EachCategoryTemplate.dart';
import 'utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat.dart';

var categories = Utils.getMockedCategories();
var searchTerms = Utils.searchTerms;
List<String> favorite = [];
 late final String userInputId;
 late final String userInputPassword;
final supabase = Supabase.instance.client;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://xvwluwcyvwuifqlaoovd.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh2d2x1d2N5dnd1aWZxbGFvb3ZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk0MjgzNTIsImV4cCI6MjAzNTAwNDM1Mn0.CDgMmdvrkOsiKnib_VPymR4AKjsDdnXlzTF7-28b2jU');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/setting': (context) => SettingPage(),
        '/menu': (context) => MenuPage(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final GlobalKey<_SplashScreenState> myWidgetKey = GlobalKey();
    final context = myWidgetKey.currentContext;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (context != null && context.mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color _idLabelColor = Colors.grey;
  Color _passwordLabelColor = Colors.grey;

  var idFocusBorder = BorderSide(color: Colors.blue, width: 2.0);
  var passwordFocusBorder = BorderSide(color: Colors.blue, width: 2.0);

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateFields() async {
    setState(() {
      _idLabelColor =
          idFocusBorder.color == Colors.red && _idLabelColor == Colors.red
              ? Colors.red
              : Colors.blue;
      _passwordLabelColor =
          passwordFocusBorder.color == Colors.red && _idLabelColor == Colors.red
              ? Colors.red
              : Colors.blue;
    });

    if (_formKey.currentState!.validate()) {
      String id = idController.text;
      String password = passwordController.text;

      final userInfo = await Supabase.instance.client
          .from('user_information')
          .select()
          .eq("id", id)
          .single();
      userInputId = userInfo[id].toString();
      userInputPassword = userInfo[password].toString();

      if (userInputId.isNotEmpty && userInputPassword.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid ID or Password')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in the required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: idFocusBorder,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: "ID",
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: _idLabelColor),
                  ),
                  style: TextStyle(color: Colors.black), // Default text color
                  onTap: () => _selectAllText(idController),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _idLabelColor = Colors.red;
                      });
                      return 'Please enter your ID';
                    }
                    return null;
                  },
                  cursorColor: Colors.blue,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: passwordFocusBorder,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: _passwordLabelColor),
                  ),
                  style: TextStyle(color: Colors.black), // Default text color
                  onTap: () => _selectAllText(passwordController),
                  onFieldSubmitted: (value) => _validateFields(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _passwordLabelColor = Colors.red;
                      });
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  cursorColor: Colors.blue, // Cursor color
                  //onFieldSubmitted: (value) => _validateFields,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _validateFields,
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectAllText(TextEditingController controller) {
    controller.selection =
        TextSelection(baseOffset: 0, extentOffset: controller.text.length);
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white, // Set the background color to white
        child: SafeArea(
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: loadImage('assets/logo.jpg'),
                  )
                ],
              ),
            ),
            body: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: searchBarDesign(context),
                    ),
                  ),
                  Expanded(
                    child: ChatPage(),
                  ),
                ],
              ),
            ),
          ),
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
          showSuggestions(context);
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return Container(); // Return an empty container if the query is empty or consists only of whitespace
    }

    final queryWords =
        query.toLowerCase().split(' ').where((word) => word.isNotEmpty).toSet();

    final matchQuery = searchTerms.where((term) {
      final lowerTerm = term.toLowerCase();
      return queryWords.every((word) => lowerTerm.contains(word));
    }).toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
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
            title: RichText(
              text: TextSpan(
                text: '',
                children: _highlightOccurrences(result, queryWords),
                style: TextStyle(color: Colors.black),
              ),
            ));
      },
    );
  }
}

/*
  The TextSpan widget in flutter allows you to style a paragraph of mixed-style text.
  It displays text that uses multiple styles. The Text may break across multiple lines or might appear
  all on the same line depending on layout constraints
*/

List<TextSpan> _highlightOccurrences(String result, Set<String> queryWords) {
  final spans = <TextSpan>[];
  final lowerCaseResult = result.toLowerCase();

  int start = 0;

  while (start < result.length) {
    final matches = queryWords
        .map((word) {
          final index = lowerCaseResult.indexOf(word, start);
          return index == -1 ? null : MapEntry(index, word.length);
        })
        .where((entry) => entry != null)
        .cast<MapEntry<int, int>>()
        .toList();

    if (matches.isEmpty) {
      spans.add(TextSpan(text: result.substring(start)));
      break;
    }

    matches.sort((a, b) => a.key.compareTo(b.key));
    final firstMatch = matches.first;

    if (firstMatch.key > start) {
      spans.add(TextSpan(text: result.substring(start, firstMatch.key)));
    }

    spans.add(TextSpan(
      text: result.substring(firstMatch.key, firstMatch.key + firstMatch.value),
      style: const TextStyle(
          backgroundColor: Colors.yellow, fontWeight: FontWeight.bold),
    ));

    start = firstMatch.key + firstMatch.value;
  }

  return spans;
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: searchBarDesign(context),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return EachCategoryTemplate(
                  name: categories[index].name,
                  //imgName: categories[index].imgName,
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: searchBarDesign(context),
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

  bool addedToFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color to white
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.clickedSubCategory.split(' ')[0]),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addedToFavorite = !addedToFavorite;
                    });
                    if (addedToFavorite == true) {
                      favorite.add(widget.clickedSubCategory);
                      debugPrint('added to list');
                    } else {
                      favorite.remove(widget.clickedSubCategory);
                      debugPrint('removed from list');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Icon((addedToFavorite == true)
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
              )
            ],
          ),
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
                              child: Text(
                                  getStringAfterFirstSpace(item["error"]!)),
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
                        SizedBox(
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
  // code for each sub-categories, it will skip the first string ex: ZT411
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
