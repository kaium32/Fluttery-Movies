import 'package:flutter/material.dart';
import 'package:movieinfoapp/fonts/text.dart';

import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({Key key, this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ModifiedText(
                text:'Top Rated Movies',
                size: 26,
              ),
              TextButton(
                  onPressed: (

                      ){},
                  child: ModifiedText(
                    text:'Show More',
                    size: 15,)),
            ],
          ),

          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>Description(
                            name:toprated[index]['title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path'],
                            description: toprated[index]['overview'],
                            vote: toprated[index]['vote_average'].toString(),
                            launch_on: toprated[index]['release_date'],
                            popularity: toprated[index]['popularity'].toString()
                            ,)));
                    },
                    child: toprated[index]['title']!= null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path']
                                ))
                            ),
                            height: 200,
                          ),
                          Container(
                            child: ModifiedText(text: toprated[index]['title']!= null?toprated[index]['title']:'Loading',),
                          )
                        ],
                      ),
                    ):Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
