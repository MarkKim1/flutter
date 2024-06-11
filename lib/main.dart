import 'package:flutter/material.dart';

import 'EachCategoryTemplate.dart';
import 'category.dart';
import 'utils.dart';
import 'category_name.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/setting': (context) => SettingPage(),
        '/menu': (context) => MenuPage(),
        '/ZD411': (context) => ZD411(),
        '/ZT411': (context) => ZT411(),
        '/ZT410': (context) => ZT410(),
        '/ZT400': (context) => ZT400(),
        '/computer': (context) => computer(),

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
  List<Category> categories = Utils.getMockedCategories();
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
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return EachCategoryTemplate( // returns the Container
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

class ZD411 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ZD411'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'ZD411 Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),

        ],
      ),
    );
  }
}
class ZT411 extends StatelessWidget { // zt411 trouble shoot solutions
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ZT411'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'ZT411 Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),

        ],
      ),
    );
  }
}
class ZT410 extends StatelessWidget { // zt410 trouble shoot solutions
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ZT410'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'ZT410 Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),

        ],
      ),
    );
  }
}
class ZT400 extends StatelessWidget { // zt400 trouble shoot solutions
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ZT400'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'ZT400 Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),

        ],
      ),
    );
  }
}
class computer extends StatelessWidget { // computer solutions
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('computer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'computer Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}


