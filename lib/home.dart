import 'package:flutter/material.dart';
import 'package:movieapp/utilities/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
//import 'package:movieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movieapp/widgets/tv.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tv=[];
  final String apiKey='f3112be7729a58f8e64c062743dd7b6f';
  final readAccessToken='yJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzExMmJlNzcyOWE1OGY4ZTY0YzA2Mjc0M2RkN2I2ZiIsInN1YiI6IjYwZmE1M2M2YzQzOWMwMDAyOWVlY2FjNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ivg6btzAr6Vh_2vNbmia7Crj3mD4WaywboaaauihVAI';
  loadmovies() async {
    TMDB tmdbWithCustomLogs=TMDB(ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingresult= await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult= await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult= await tmdbWithCustomLogs.v3.tv.getPouplar();


    setState(() {
      trendingmovies=trendingresult["results"];
      topratedmovies=topratedresult["results"];
      tv=tvresult["results"];
    });
    print(trendingmovies);
    print(tv);


  }
  @override
  void initState() {
    loadmovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(text: "Flutter Moive App"),
      ),
      body: ListView(
        children: [
          Tvv(tv: tv),
          TopRated(topRated: topratedmovies,),
          TrendingMovies(trending: trendingmovies,)
        ],
      ),
    );
  }
}
