import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:name_app/searchBar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'EachCategoryTemplate.dart';
import 'utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favoritePage.dart';
import 'fullScreenImage.dart';

var categories;
var searchTerms;
String fetchedIdOutside = "";
String fetchedPasswordOutside = "";
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
        '/menu': (context) => MenuPage(),
        '/favoritePage': (context) => favoritePage(),
      },
    ),
  );
}

Widget loadImage(String path) {
  return Image.asset(
    path,
    fit: BoxFit.cover, // This makes the image cover the available space
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
  bool rememberId = false;

  Color _idLabelColor = Colors.grey;
  Color _passwordLabelColor = Colors.grey;

  var idFocusBorder = BorderSide(color: Colors.blue, width: 2.0);
  var passwordFocusBorder = BorderSide(color: Colors.blue, width: 2.0);

  @override
  void initState() {
    super.initState();
    _loadRememberedId();
  }

  void _loadRememberedId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedId = prefs.getString('rememberedId');
    if (savedId != null) {
      setState(() {
        idController.text = savedId;
        rememberId = true;
      });
    }
  }

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
      var userInfo;
      try {
        userInfo = await Supabase.instance.client
            .from('user_information')
            .select()
            .eq("id", id)
            .single();

        var searchTermPreLoad =
            await supabase.from('utils').select('error').order('error');
        if(searchTermPreLoad.isNotEmpty){
          searchTerms = searchTermPreLoad.map((error) => error['error'] as String).toList();
        }

        final fetchedId = userInfo['id'].toString().toUpperCase();
        final fetchedPassword = userInfo['password'].toString().toUpperCase();
        fetchedIdOutside = fetchedId;
        fetchedPasswordOutside = fetchedPassword;
        if (password == fetchedPassword) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);

          if (rememberId) {
            await prefs.setString('rememberedId', id);
          } else {
            await prefs.remove('rememberedId');
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid ID or Password')),
          );
        }
      } catch (error) {
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('DB error')),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: AppBar(
            backgroundColor: Colors.white,
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
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: idFocusBorder,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        labelText: "ID",
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle: TextStyle(color: _idLabelColor),
                      ),
                      style:
                          TextStyle(color: Colors.black), // Default text color
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: passwordFocusBorder,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelStyle:
                            TextStyle(color: _passwordLabelColor),
                      ),
                      style:
                          TextStyle(color: Colors.black), // Default text color
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
                    child: Row(
                      children: [
                        Checkbox(
                          value: rememberId,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberId = value ?? false;
                            });
                          },
                        ),
                        const Text('Remember ID'),
                      ],
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
                  icon: Icon(
                    Icons.logout,
                    size: 35,
                  ),
                  tooltip: '로그아웃',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                  tooltip: 'added favorites',
                  onPressed: () {
                    Navigator.pushNamed(context, '/favoritePage');
                  },
                )
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: searchBarDesign(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: Minseok Kim',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Email: kim970602@gmail.com',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Number: (334) 471 - 9314',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: Nojeong Woong',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Email: jeongwoong@seoyoneh.us',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Number: (513) 910 - 2206',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )
              ],
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
  var categories1;

  @override
  void initState() {
    super.initState();
    _callManu();
  }

  Future<void> _callManu() async {
    categories1 = await supabase.rpc('get_menu');
    setState(() {});
  }

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
            child: categories1 == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: categories1.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return EachCategoryTemplate(
                        name: categories1[index]['name'],
                        describe: categories1[index]['describe'],
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
  var eachMenu;
  @override
  void initState() {
    super.initState();
    _callEachMenu();
  }

  Future<void> _callEachMenu() async {
    try {
      eachMenu = await supabase
          .rpc('get_eachmenu', params: {'error_input': widget.categoryName});
    } on PostgrestException catch (error) {
      SnackBar(
        content: Text(error.message),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} Trouble Shoot'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            iconSize: 35,
            tooltip: 'Go to main page',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainPage()), // Replace with your main page widget
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: searchBarDesign(context),
          ),
          Expanded(
            child: eachMenu == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount: eachMenu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(
                          getStringAfterFirstSpace(
                              eachMenu[index]['error'].toString()),
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EachSubCategoryPage(
                                clickedSubCategory:
                                    eachMenu[index]['error'].toString(),
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
  _EachSubCategoryPageState createState() => _EachSubCategoryPageState();
}

class _EachSubCategoryPageState extends State<EachSubCategoryPage> {
  List<Map<String, dynamic>> filteredErrorSolutionList = [];
  bool addedToFavorite = false;
  var eachCategoryView;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
    _callClickedSubcategory();
  }

  Future<void> _callClickedSubcategory() async {
    try {
      eachCategoryView = await supabase.rpc('clicked_category', params: {
        'input': widget.clickedSubCategory,
      });
      if (eachCategoryView != null) {
        for (int i = 0; i < eachCategoryView.length; i++) {
          filteredErrorSolutionList.add({
            'id': eachCategoryView[i]['id'],
            'error': eachCategoryView[i]['error'],
            'solution': eachCategoryView[i]['solution'],
            'image': eachCategoryView[i]['image'],
            'videourl': eachCategoryView[i]['videourl']
          });
        }
      }
    } on PostgrestException catch (error) {
      debugPrint(error.message);
    }
    setState(() {});
    print(widget.clickedSubCategory);
    print('eachCategoryView:$eachCategoryView');
    print('filteredErrorSolutionList $filteredErrorSolutionList');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.clickedSubCategory.split(' ')[0]),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      addedToFavorite = !addedToFavorite;
                    });
                    if (addedToFavorite) {
                      await addFavorite();
                    } else {
                      await removeFavorite();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      iconColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      )),
                  child: Icon(addedToFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                if (filteredErrorSolutionList.isNotEmpty)
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(filteredErrorSolutionList[0]['error']),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                ...filteredErrorSolutionList.map((item) {
                  String solution =
                      item['solution'] as String; // Ensure this is a String
                  int step = filteredErrorSolutionList.indexOf(item) +
                      1; // Adjusting the step count based on the list index
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
                                  'Step $step',
                                ), // Correctly display the step
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(solution),
                              )
                            ])
                          ],
                        ),
                        if (item.containsKey('image') && item['image'] != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                _openFullScreenImageView(
                                    [item['image'] as String],
                                    0 // only one image is passed, so index is 0
                                    );
                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    item[
                                        'image'], // Use Image.network if the image is a URL
                                    height: 300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                        ),
                        if (item.containsKey('videourl') &&
                            item['videourl'] != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Uri uri =
                                      Uri.parse(item['videourl'].toString());
                                  _launchURL(uri);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  backgroundColor: Colors.blue,
                                ),
                                child: Text(
                                  'Watch Video',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openFullScreenImageView(List<String> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageView(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  Future<void> addFavorite() async {
    try {
      await supabase.from('favorite').insert({
        'id': fetchedIdOutside.toString(),
        'clicked_sub_category': widget.clickedSubCategory.toString(),
      });
      print('added');
    } on PostgrestException catch (error) {
      debugPrint('Error inserting into favorite: $error');
    }
  }

  Future<void> removeFavorite() async {
    try {
      await supabase
          .from('favorite')
          .delete()
          .eq('id', fetchedIdOutside)
          .eq('clicked_sub_category', widget.clickedSubCategory);
    } on PostgrestException catch (error) {
      debugPrint('Error deleting from favorite: $error');
    }
  }

  Future<void> _checkFavoriteStatus() async {
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase
          .from('favorite')
          .select()
          .eq('id', fetchedIdOutside)
          .eq('clicked_sub_category', widget.clickedSubCategory);
      if (response.isNotEmpty) {
        setState(() {
          addedToFavorite = true;
        });
      }
    } on PostgrestException catch (error) {
      debugPrint('Error: $error');
    }
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
