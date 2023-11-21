import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: (movieDB.backdropPath != '')
     ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
     : 'no-backdrop',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath:(movieDB.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
      : 'no-poster',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
    adult: movie.adult, 
    backdropPath: (movie.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
      : 'no-poster',
    genreIds: movie.genres.map((e) => e.name).toList(), 
    id: movie.id, 
    originalLanguage: movie.originalLanguage, 
    originalTitle: movie.originalTitle, 
    overview: movie.overview, 
    popularity: movie.popularity, 
    posterPath:(movie.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
      : 'no-poster', 
    releaseDate: movie.releaseDate, 
    title: movie.title, 
    video: movie.video, 
    voteAverage: movie.voteAverage, 
    voteCount: movie.voteCount
  );
}
