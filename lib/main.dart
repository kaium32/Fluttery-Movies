import 'package:flutter/material.dart';
import 'package:movieinfoapp/fonts/text.dart';
import 'package:movieinfoapp/widgets/toprated.dart';
import 'package:movieinfoapp/widgets/trending.dart';
import 'package:movieinfoapp/widgets/tv.dart';
import 'package:movieinfoapp/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.black
      ),
      title: 'Movie Info App',
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List upcomingmovies = [];
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '2100b8959000cd553e55d850c3b00e58';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMTAwYjg5NTkwMDBjZDU1M2U1NWQ4NTBjM2IwMGU1OCIsInN1YiI6IjYwZGRkMzEyYTEyODU2MDA1ZWFmNGIxNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2WvGY_K7N6O8KgMYUljtLwKezzBQJzufTdZP7Va8xqY';

  @override
  void initState(){
    bulkmovies();
    super.initState();
  }

  bulkmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),);
    Map upcomingresults = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      upcomingmovies = upcomingresults['results'];
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(upcomingmovies);
    print(trendingmovies);
    print(topratedmovies);
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: ModifiedText(text:'Movie Info'),
          titleSpacing: 0,
          leading: IconButton(icon: Icon(Icons.menu),
            onPressed: (){

            },),
          actions: [
            IconButton(icon: Icon(Icons.search),
                onPressed: (){
                }
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white70,
            indicatorWeight: 3,
            isScrollable: true,
              tabs: [
                Tab(icon: Icon(Icons.movie),child: ModifiedText(text: 'Top Rated',),),
                Tab(icon: Icon(Icons.movie),child: ModifiedText(text: 'Top Rated',),),
                Tab(icon: Icon(Icons.movie),child: ModifiedText(text: 'Top Rated',),),
                Tab(icon: Icon(Icons.movie),child: ModifiedText(text: 'Top Rated',),),
                Tab(icon: Icon(Icons.movie),child: ModifiedText(text: 'Top Rated',),),
                Tab(icon: Icon(Icons.movie),child: ModifiedText(text: 'Top Rated',),),
              ],
          ),
        ),
        body:
        ListView(
            children: [
              UpcomingMovies(upcoming: upcomingmovies),
              TrendingMovies(trending:trendingmovies),
              TopRatedMovies(toprated: topratedmovies),
              TvShows(tv: tv)
            ],
        ),

      ),
    );
  }
}

