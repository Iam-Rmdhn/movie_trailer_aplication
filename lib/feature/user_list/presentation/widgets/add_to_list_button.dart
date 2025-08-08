import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_bloc.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_event.dart';

class AddToListButton extends StatelessWidget {
  final TMDBMovie movie;
  final double? iconSize;
  final Color? iconColor;
  final Color? addedIconColor;

  const AddToListButton({
    super.key,
    required this.movie,
    this.iconSize = 24,
    this.iconColor,
    this.addedIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        bool isInList = false;

        if (state is UserListLoaded) {
          isInList = state.movieIds.contains(movie.id);
        }

        return GestureDetector(
          onTap: () {
            if (isInList) {
              context.read<UserListBloc>().add(RemoveMovieFromList(movie.id));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${movie.title} removed from My List'),
                  duration: const Duration(seconds: 2),
                ),
              );
            } else {
              context.read<UserListBloc>().add(AddMovieToList(movie));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${movie.title} added to My List'),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isInList ? Icons.check_circle : Icons.add_circle_outline,
              key: ValueKey(isInList),
              size: iconSize,
              color: isInList
                  ? (addedIconColor ?? Colors.green)
                  : (iconColor ?? Theme.of(context).iconTheme.color),
            ),
          ),
        );
      },
    );
  }
}

class MyListActionButton extends StatelessWidget {
  final TMDBMovie movie;

  const MyListActionButton({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        bool isInList = false;

        if (state is UserListLoaded) {
          isInList = state.movieIds.contains(movie.id);
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton.icon(
            onPressed: () {
              if (isInList) {
                context.read<UserListBloc>().add(RemoveMovieFromList(movie.id));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${movie.title} removed from My List'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              } else {
                context.read<UserListBloc>().add(AddMovieToList(movie));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${movie.title} added to My List'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isInList ? Icons.check : Icons.add,
                key: ValueKey(isInList),
                size: 18,
                color: Colors.white,
              ),
            ),
            label: Text(
              isInList ? 'In My List' : 'My List',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: isInList ? Colors.green : Colors.grey[800],
              elevation: 2,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        );
      },
    );
  }
}
