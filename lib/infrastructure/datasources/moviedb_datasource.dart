import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.apiKey, 'language': 'es-MX'}
    ));
      
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
      queryParameters: {
      'page' : page
      }
    );
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((e) => e.backdropPath != 'no-backdrop')
        .where((e) => e.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDbToEntity(e)
        ).toList();

    return movies;
  }
  
  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((e) => e.backdropPath != 'no-backdrop')
        .where((e) => e.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDbToEntity(e)
        ).toList();

    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular',
      queryParameters: {
      'page' : page
      }
    );
    return _jsonToMovie(response.data);
  }
  
  //top_rated

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
      'page' : page
      }
    );
    return _jsonToMovie(response.data);
  }
}
