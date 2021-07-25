import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_fest/models/movie.dart';
import 'package:movie_fest/services/api_constants.dart';

class MovieFestApi{

  //get popular movies
  static Future<List<Result>?> getPopularMovies() async{
    http.Response movieUrl = await http.get(Uri.parse(
      '${ApiConstants.baseUrl}3/movie/popular?api_key=${ApiConstants.apiKey}&language=en-US&page=1'
    ));
    if(movieUrl.statusCode==200){
      Iterable movieString = jsonDecode(movieUrl.body)['results'];
      // print(movieString);
      return movieString.map((json) => Result.fromJson(json)).toList();
    }else{
      return null;
    }
  }

}