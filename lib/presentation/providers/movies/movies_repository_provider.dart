import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_reposiroty_impl.dart';
import 'package:riverpod/riverpod.dart';

//Este repositorio es inmutable
final movieReposirotyProvider = Provider((ref) => MovieReposirotyImpl(MoviedbDataSource()));