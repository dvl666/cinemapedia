import 'package:cinemapedia/config/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/config/infrastructure/repositories/movie_reposiroty_impl.dart';
import 'package:riverpod/riverpod.dart';

//Este repositorio es inmutable
final movieReposirotyProvider = Provider((ref) => MovieReposirotyImpl(MoviedbDataSource()));