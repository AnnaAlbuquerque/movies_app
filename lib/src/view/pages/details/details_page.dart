import 'package:flutter/material.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/image_utils.dart';
import 'package:movies_app/src/view/widgets/movie_detail_widget.dart';

class DetailsPage extends StatelessWidget {
  final MovieModel movie;
  const DetailsPage({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColorDark.withOpacity(0.6),
                Theme.of(context).primaryColorDark.withOpacity(0),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.transparent],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.network(
                    '${ImageUtils.baseURLImage}${movie.backdropPath}',
                    height: MediaQuery.of(context).size.height * 0.7,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
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
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            MovieDetailWidget(
                              info: movie.originalLanguage,
                            ),
                            const SizedBox(width: 7),
                            MovieDetailWidget(
                              info: movie.releaseDate.substring(0, 4),
                            ),
                            const SizedBox(width: 7),
                            //const Spacer(),
                            MovieDetailWidget(
                              info: movie.voteAverage.toStringAsFixed(1),
                              icon: const Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                                size: 15,
                              ),
                            ),
                            const SizedBox(width: 7),
                            MovieDetailWidget(
                              info: movie.popularity.toStringAsFixed(0),
                              icon: const Icon(
                                Icons.arrow_circle_up,
                                size: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                movie.overview,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
