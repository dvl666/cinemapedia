import 'package:flutter/material.dart';

class CustomAppbar
 extends StatelessWidget {
  const CustomAppbar
  ({super.key});

  @override
  Widget build(BuildContext context) {

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

              const IconButton(
                onPressed: null, 
                icon: Icon(Icons.search)
              )
            ],
          ),
        ),
      ),
    );
  }
}