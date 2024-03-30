import 'package:flutter/material.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/image_utils.dart';
import 'package:movies_app/src/view/widgets/movie_detail_widget.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieModel movie;
  final bool showDetails;
  const MovieItemWidget({
    required this.movie,
    this.showDetails = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Natigate to movie details
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: Image.network(
              '${ImageUtils.baseURLImage}${movie.poster}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          if (showDetails) ...[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColorDark.withOpacity(0),
                    Theme.of(context).primaryColorDark.withOpacity(1),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        MovieDetailWidget(
                          info: movie.releaseDate.substring(0, 4),
                        ),
                        const SizedBox(width: 7),
                        MovieDetailWidget(
                          info: movie.voteAverage.toStringAsFixed(1),
                          icon: const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
