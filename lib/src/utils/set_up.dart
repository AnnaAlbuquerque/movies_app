import 'package:get_it/get_it.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/services/movie_http_client.dart';

final getIt = GetIt.I;

void setupGetIt() {
  getIt.registerLazySingleton<MovieHTTPClient>(() => MovieHTTPClient());
  getIt.registerLazySingleton<MoviesController>(
      () => MoviesController(client: getIt<MovieHTTPClient>()));
}
