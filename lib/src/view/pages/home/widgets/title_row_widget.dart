import 'package:flutter/material.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/movie_list_type.dart';
import 'package:movies_app/src/view/pages/more/more_page.dart';

class TitleRowBuild extends StatelessWidget {
  final bool showMoreButton;
  final String title;
  final List<MovieModel> movieList;

  const TitleRowBuild({
    required this.title,
    required this.movieList,
    this.showMoreButton = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          if (showMoreButton) ...[
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColorLight),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MorePage(
                      title: title,
                      moviesList: movieList,
                      movieListType: title.parseMovieListType(),
                    ),
                  ),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'More',
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward,
                    size: 15,
                  )
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
