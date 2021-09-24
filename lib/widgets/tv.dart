import 'package:flutter/material.dart';
import 'package:movieinfoapp/fonts/text.dart';

import '../description.dart';

class TvShows extends StatelessWidget {
  final List tv;

  const TvShows({Key key, this.tv}) : super(key: key);
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
                text:'Tv Shows Movies',
                size: 26,
              ),
              TextButton(
                  onPressed: (){},
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
                itemCount: tv.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>Description(
                            name:tv[index]['original_name'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+ tv[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+ tv[index]['poster_path'],
                            description: tv[index]['overview'],
                            vote: tv[index]['vote_average'].toString(),
                            launch_on: tv[index]['first_air_date'],
                            popularity: tv[index]['popularity'].toString()
                            ,)));
                    },
                    child: tv[index]['original_name']!= null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+ tv[index]['poster_path']
                                ))
                            ),
                            height: 200,
                          ),
                          Container(
                            child: ModifiedText(text: tv[index]['original_name']!= null?tv[index]['original_name']:'Loading',),
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
