import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsReposiroty {
  Future<List<Actor>> getActorsByMovie(String movieId);
}