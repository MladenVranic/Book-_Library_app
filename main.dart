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
  int _selectedItem = 0; //item counter



  //methods
  //method to change the current index in the Widget List
  void changeItem(int index){
    setState(() {
      _selectedItem = index;
    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.title),
      ),
      body: Center(//body content begins here
        child: Align(
            alignment: Alignment.topCenter,
        child: Padding( //this Padding is for the entire container to be scaled
          padding: EdgeInsets.all(10.0),
        child: Container(
          height: 150.0,
        child: Card( //this card widget is in the parent container
          child: Align(
            alignment: Alignment.center,
          child: Column(
            children: <Widget>[ //array of child widgets within the whole container
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){ //navigate to specific index route
          switch(index){
            //category Route
            case 1 :{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArchiveRoute()),
              );
            }break;
            case 2 :{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryRoute()),
              );
            } break;
            //home Route
            case 0: {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
              } break;
            }
        },
        backgroundColor: primaryColor,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_outlined),
            label: 'archive'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Kategorien',
          ),
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Colors.teal[400],
      ),
    );
  }
}


//category route
class CategoryRoute extends StatelessWidget {
  const CategoryRoute({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: const Text('back'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}

//archive route
class ArchiveRoute extends StatelessWidget {
  const ArchiveRoute({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: const Text('back'),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}