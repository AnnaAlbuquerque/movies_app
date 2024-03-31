import 'package:flutter/material.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/image_utils.dart';
import 'package:movies_app/src/view/pages/details/details_page.dart';
import 'package:movies_app/src/view/widgets/dark_gradient_widget.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(movie: movie),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.network(
              '${ImageUtils.baseURLImage}${movie.poster}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            movie.title,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (showDetails) ...[
            const DarkGradientWidget(),
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
