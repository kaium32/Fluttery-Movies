import 'package:flutter/material.dart';
import 'package:movieinfoapp/fonts/text.dart';

import '../description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key key, this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ModifiedText(
                text:'Trending Movies',
                size: 26,
              ),
              TextButton(
                  onPressed: (){
                    Description();
                  },
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
                itemCount: trending.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>Description(
                            name:trending[index]['title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path'],
                            description: trending[index]['overview'],
                            vote: trending[index]['vote_average'].toString(),
                            launch_on: trending[index]['release_date'],
                            popularity: trending[index]['popularity'].toString()
                            ,)));
                    },
                    child: trending[index]['title']!= null?Container(
                      padding: EdgeInsets.all(5),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path']
                                ))
                            ),
                            height: 200,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: ModifiedText(text: trending[index]['title']!= null?trending[index]['title']:'Loading',),
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
