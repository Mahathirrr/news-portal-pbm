import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';
import 'kategori.dart';
import 'profil.dart';

void main() {
  runApp(const MyApp(initialPage: 0));
}

class MyApp extends StatefulWidget {
  final int initialPage;
  const MyApp({Key? key, required this.initialPage}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _page = 0;
  final List<Widget> _pageOptions = [
    const KategoriPage(),
    const HomePage(),
    const ProfilPage(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _page = widget.initialPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SafeArea(
        child: Scaffold(
          body: _pageOptions[_page],
          bottomNavigationBar: CurvedNavigationBar(
            height: 50.0,
            color: Colors.blue,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            items: const <Widget>[
              Icon(Icons.category, color: Colors.white),
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.account_circle, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
