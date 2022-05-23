import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class detailedImageScreen extends StatelessWidget {
  String imageUrl;
  detailedImageScreen(this.imageUrl);

  @override
  Widget build(BuildContext context) {

    void saveImage(String ImgUrl) async {
     await GallerySaver.saveImage(ImgUrl, toDcim:true);
    }

    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    saveImage(imageUrl);
                  },
                  child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black26.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),),
                    child: Text(
                      'SAVE WALLPAPER',
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                FlatButton(onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('CANCEL', style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
