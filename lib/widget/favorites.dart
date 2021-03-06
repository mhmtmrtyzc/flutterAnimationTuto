import 'package:animation_tuto/provider/people_provider.dart';
import 'package:animation_tuto/screens/secondscreen.dart';
import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  final String nameList;
  final String surnameList;
  final String numberList;
  final int index;

  const Favorites(
      {Key? key,
      required this.nameList,
      required this.surnameList,
      required this.numberList,
      required this.index})
      : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  get peopleProvider => null;

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<PeopleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: !fav.checkIsFav(widget.index)
                      ? Icon(Icons.star_border_outlined)
                      : Icon(Icons.star),
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                  onPressed: () {
                    if (!fav.checkIsFav(widget.index)) {
                      fav.addFavorite(widget.index);
                      print("addFavorite");
                    } else {
                      fav.removeFavorite(widget.index);
                      print("removeFavorite");
                    }
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 90),
            ),
            Text(
              widget.nameList,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.surnameList,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.numberList,
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {},
                 icon: Icon(Icons.call),
                 highlightColor: Colors.transparent,
                 hoverColor: Colors.transparent,
                 ),
                IconButton(onPressed: () {}, 
                icon: Icon(Icons.message_rounded),
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                ),
                IconButton(onPressed: () {}, 
                icon: Icon(Icons.video_camera_back),
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}