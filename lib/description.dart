import 'package:flutter/material.dart';
import 'package:movieinfoapp/fonts/text.dart';
import 'package:movieinfoapp/main.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on, popularity, video;

  const Description({Key key, this.name, this.description, this.bannerurl, this.posterurl, this.vote, this.launch_on, this.popularity, this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl,fit: BoxFit.cover,),
                  )),
                  Positioned(child:IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                  })),
                  Positioned(
                    bottom: 10,
                      child: ModifiedText(text: '⭐ Average Rating -'+vote,size: 18,))
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name!=null?name:'Not Loaded',size: 24,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Releasing On -'+launch_on,size: 14,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Popularity -'+popularity,size: 14,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(text: 'Story Synopsis: '+description,size: 14,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
