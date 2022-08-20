import 'package:flutter/material.dart';
import 'package:movieapp/utilities/text.dart';
import '../description.dart';
class Tvv extends StatelessWidget {
  final List tv;
  Tvv({this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Popular Tv Shows",size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context,index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(
                          name: tv[index]['original_name'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                          //posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                          description: tv[index]['overview'],
                          vote: tv[index]['vote_average'].toString(),
                          launch_on: tv[index]['release_date'],
                        )));
                      },
                    child:tv[index]['original_name']!=null?
                    //tv[index]['original_name']?
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width:250,
                            height: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                                ),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(child: modified_text(text: tv[index]['original_name']!=null?
                          tv[index]['original_name']:'Loading')),
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
