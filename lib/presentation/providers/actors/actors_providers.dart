import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorRepositoryProvider);
  return ActorsByMovieNotifier(getActorsByMovie: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActorsByMovie;

  ActorsByMovieNotifier({
   required this.getActorsByMovie,
  }): super({});

  Future<void> loadActors(String movieId) async {
    if ( state[movieId] != null ) return;
    print('realizando peticion de actores');
    final actors = await getActorsByMovie(movieId);
    
    state = {...state, movieId: actors};
  }
}