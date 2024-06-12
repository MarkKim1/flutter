import 'package:flutter/material.dart';

import 'EachCategoryTemplate.dart';
import 'category.dart';
import 'utils.dart';
import 'category_name.dart';

List<Category> categories = Utils.getMockedCategories();
Map<String,List<Category>>? mainCategory;
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
        '/computer': (context) => Computer(),
        '/MES': (context) => MES(),
        '/EachSubCategoryPage': (context) => EachSubCategoryPage(),
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

class ZD411 extends StatefulWidget {
  @override
  State<ZD411> createState() => _ZD411State();
}

class _ZD411State extends State<ZD411> {
  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5, // need to fix this later
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(
                    "List item $index",
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                  },
                );
              }, separatorBuilder: (BuildContext context, int index) {
                return  Divider(
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

class ZT411 extends StatefulWidget {
  @override
  State<ZT411> createState() => _ZT411State();
}

class _ZT411State extends State<ZT411> {
  // zt411 trouble shoot solutions
  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class ZT410 extends StatefulWidget {
  @override
  State<ZT410> createState() => _ZT410State();
}

class _ZT410State extends State<ZT410> {
  // zt410 trouble shoot solutions
  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class ZT400 extends StatefulWidget {
  @override
  State<ZT400> createState() => _ZT400State();
}

class _ZT400State extends State<ZT400> {
  // zt400 trouble shoot solutions
  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Computer extends StatefulWidget {
  @override
  State<Computer> createState() => _ComputerState();
}

class _ComputerState extends State<Computer> {
  // computer solutions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'Computer Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class MES extends StatefulWidget {
  @override
  State<MES> createState() => _MESState();
}

class _MESState extends State<MES> {
  // computer solutions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MES'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              'MES Trouble Shoot',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class EachSubCategoryPage extends StatefulWidget {
  @override
  State<EachSubCategoryPage> createState() => _EachSubCategoryPageState();
}

class _EachSubCategoryPageState extends State<EachSubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
