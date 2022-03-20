import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Library',
      theme: ThemeData(
        //overrides default theme
        brightness: Brightness.dark,
        //primaryColor: primaryColor,

        fontFamily: 'Georgia',
      ),
      home: const MyHomePage(title: 'Smart Library'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title}) : super(key: key);

  //attributes
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
     //colors
  static const primaryColor = Color.fromARGB(80, 155, 0, 0);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(), //method which opens Drawer
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: Text(widget.title),
      ),
      drawer: Drawer( //Drawer is for navigation of app
        child: ListView(
          children: <Widget>[//Array of child elements
              Container(
                height: 80.0,
                child: const DrawerHeader(
                decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Align(
                alignment: Alignment.center,
                child:Text(
                'Menü',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: null,
              child: const Text('Home')
              ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: null,
              child: const Text('Kategorien'),
              ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: null,
              child: const Text('Archiv'))
          ],
        )
      ),
      body: Center(
        child: Align(
            alignment: Alignment.topCenter,
        child: Container(
          height: 150.0,
        child: Card(
          child: Align(
            alignment: Alignment.center,
          child: Column(
            children: <Widget>[
               Container(
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                child: Text('Book of the Month',
                  style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(25.0),
                      child: Align (
                        alignment: Alignment.centerLeft,
                      child: Text('Icon'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
