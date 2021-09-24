import 'package:flutter/material.dart';
import 'package:movieinfoapp/description.dart';
import 'package:movieinfoapp/fonts/text.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;

  const UpcomingMovies({Key key, this.upcoming}) : super(key: key);
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
                text:'Upcoming Movies',
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
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: upcoming.length,
                itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context)=>Description(
                          name:upcoming[index]['title'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+ upcoming[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+ upcoming[index]['poster_path'],
                            description: upcoming[index]['overview'],
                            vote: upcoming[index]['vote_average'].toString(),
                            launch_on: upcoming[index]['release_date'],
                            popularity: upcoming[index]['popularity'].toString()
                            ,)));
                  },
                  child: upcoming[index]['title']!= null?Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+ upcoming[index]['backdrop_path']
                            ),
                              fit: BoxFit.cover
                            )

                          ),
                          width: 250,
                          height: 140,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: ModifiedText(text: upcoming[index]['title']!= null?upcoming[index]['title']:'Loading',),
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
