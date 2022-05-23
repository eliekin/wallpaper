import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


import 'detailed_image.dart';

class MyHomeScreen extends StatefulWidget {
  static const routeName = '/MyHomeScreen';
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int radomNumber = new Random().nextInt(1);
  

  @override
  Widget build(BuildContext context) {
     void _reloadPage() {
         Timer(Duration(seconds: 2), () => Navigator.push(
       context, MaterialPageRoute(
         builder: (context) => MyHomeScreen()),
         )
      );
      }
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: _reloadPage,
        icon: Icon(
          Icons.refresh_rounded,
          size: 35,
          color: Colors.teal,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.000,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Wall',
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontFamily: 'SourceSansPro'),
            ),
            Text(
              'paper',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.pink,
                  fontFamily: 'SourceSansPro'),
            ),
          ],
        ),
      ),
      body: radomNumber.isEven ? buildBody() 
      : Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.custom(
  gridDelegate: SliverQuiltedGridDelegate(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    repeatPattern: QuiltedGridRepeatPattern.inverted,
    pattern: [
        QuiltedGridTile(2, 2),
        QuiltedGridTile(1, 1),
        QuiltedGridTile(1, 1),
        QuiltedGridTile(1, 2),
    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) => buildCard(index),
  ),
),
      )
    );
  }

  @override
  Widget buildCard(int index) {
    return Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => detailedImageScreen(
                    'https://source.unsplash.com/random?sig=$index'),
              ),
            );
          },
          child: Image.network('https://source.unsplash.com/random?sig=$index', fit: BoxFit.cover,),
        ),
      ),
    );
  }

  @override
  Widget buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
      ),
    );
  }
}

