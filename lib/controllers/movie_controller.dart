import 'package:get/get.dart';
import 'package:movie_fest/models/movie.dart';
import 'package:movie_fest/services/movie_api.dart';

class MovieController extends GetxController{
  var movieList = <Result>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPopularMovies();
  }

  void getPopularMovies() async{

    try {
      isLoading(true);
      var movie = await MovieFestApi.getPopularMovies();
      if(movie != null){
        movieList.value = movie;
      }
    } finally {
      isLoading(false);
    }

  }

}