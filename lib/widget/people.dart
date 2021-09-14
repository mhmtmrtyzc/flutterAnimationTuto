import 'package:animation_tuto/screens/fourthscreen.dart';
import 'package:animation_tuto/widget/favorites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

void changeScreen(BuildContext _context, Widget _widget) {
  Navigator.push(_context, MaterialPageRoute(builder: (_context) => _widget));
}

class _PeopleState extends State<People> {
  void callbacks() {}
  List<String> nameList = <String>[];
  List<String> surnameList = <String>[];
  List<String> numberList = <String>[];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("nameList") != null) {
      setState(() {
        nameList = (prefs.getStringList("nameList"))!;
        surnameList = (prefs.getStringList("surnameList"))!;
        numberList = (prefs.getStringList("numberList"))!;
        
      
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: nameList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.grey.shade800,
                    leading: IconButton(
                    onPressed: (){
                     Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => Favorites(),
                ),
              );

                      }, 
                      icon: Icon(Icons.person)),
                                       
                    subtitle: Text(numberList[index]),
                    title: Text(
                      nameList[index] + " " + surnameList[index],
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await getData();
            },
          ),
          IconButton(
              onPressed: () {
                changeScreen(context, Fourthscreen());
              },
              iconSize: 30,
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}