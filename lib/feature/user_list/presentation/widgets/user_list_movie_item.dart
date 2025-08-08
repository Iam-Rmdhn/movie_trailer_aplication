import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_event.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_bloc.dart';
import 'package:movie_app/feature/movie_detail/presentation/screens/movie_detail_screen.dart';

class UserListMovieItem extends StatelessWidget {
  final TMDBMovie movie;

  const UserListMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: movie.fullPosterPath,
            width: 60,
            height: 90,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: 60,
              height: 90,
              color: Colors.grey[300],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: 60,
              height: 90,
              color: Colors.grey[300],
              child: const Icon(Icons.error),
            ),
          ),
        ),
        title: Text(
          movie.title,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Rating: ${movie.voteAverage.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Release: ${movie.releaseDate}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<UserListBloc>().add(RemoveMovieFromList(movie.id));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${movie.title} removed from My List'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
