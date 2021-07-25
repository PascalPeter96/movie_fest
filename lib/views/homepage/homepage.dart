import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_fest/controllers/movie_controller.dart';
import 'package:movie_fest/views/movie_details/movie_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.put(MovieController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Popular Movie Fest'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: movieController.movieList.length,
            itemBuilder: (context, index){
              final movie = movieController.movieList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=> MovieDetails(movie: movie,));
                    // transition: Transition.leftToRight,
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.pinkAccent,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'movie_tag${movie.posterPath}',
                          child: CachedNetworkImage(
                          height: 150,
                          width: 100,
                          imageUrl: 'https://image.tmdb.org/t/p/original${movie.posterPath}',),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(movie.title.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),),
                                SizedBox(height: 8),
                                Text('${movie.voteAverage.toString()} ⭐',
                                style: TextStyle(
                                  color: Colors.white
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
