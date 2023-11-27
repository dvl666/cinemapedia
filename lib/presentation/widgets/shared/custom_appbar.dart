import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/delegates/search_movies_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar
 extends ConsumerWidget {
  const CustomAppbar
  ({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary,),
              const SizedBox(width: 5,),
              Text('Cinemapedia', style: textStyle.titleMedium),

              const Spacer(),

               IconButton(
                onPressed: (){

                  final searchedMoviesRepository = ref.read(searchedMoviesProvider);
                  final searchQueryRepository = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searchQueryRepository,
                    context: context, 
                    delegate: SearchMoviesDelegate(
                      initialMovies: searchedMoviesRepository,
                      searchMovies: ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery
                    ) 
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/movie/${movie.id}');
                  });

                }, 
                icon: const Icon(Icons.search)
              )
            ],
          ),
        ),
      ),
    );
  }
}