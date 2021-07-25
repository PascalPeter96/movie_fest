import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_fest/models/movie.dart';

class MovieDetails extends StatelessWidget {
  final Result? movie;
  const MovieDetails({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie!.title.toString()),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height*0.5,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                  AspectRatio(
                  aspectRatio: 4/3,
                  child: Hero(
                    tag: 'movie_tag${movie!.posterPath}',
                    child: CachedNetworkImage(imageUrl: 'https://image.tmdb.org/t/p/original${movie?.posterPath}',
                      fit: BoxFit.fill,),
                  ),
                ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text('${movie!.voteAverage.toString()} ⭐',
                          style: TextStyle(
                              color: Colors.deepOrange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ),
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                child: Row(
                  children: [
                    SizedBox(
                      child: Text('Title : ', style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 20,
                      ),),
                    ),
                    Expanded(
                      child: Wrap(children: [
                        Text(movie!.title.toString(),style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),)
                      ],),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: SizedBox(
                  child: Text('Overview', style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 20,
                  ),),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 1),
                  child: Text(movie!.overview.toString(),
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

