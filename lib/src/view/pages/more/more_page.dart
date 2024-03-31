import 'package:flutter/material.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/utils/movie_list_type.dart';
import 'package:movies_app/src/view/widgets/loading_poster_widget.dart';
import 'package:movies_app/src/view/widgets/movie_item_widget.dart';

class MorePage extends StatefulWidget {
  final String title;
  final List<MovieModel> moviesList;
  final MovieListType movieListType;

  const MorePage({
    required this.title,
    required this.moviesList,
    required this.movieListType,
    super.key,
  });

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  late List<MovieModel> fullList;
  late ScrollController scrollController;
  bool isLoadingPage = false;
  late int page;
  late int fullListLength;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    fullList = List.from(widget.moviesList);
    page = 1;
    fullListLength = fullList.length;
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          fullListLength == fullList.length) {
        getMoreMovies();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void getMoreMovies() {
    if (!isLoadingPage) {
      page++;
      setState(() {
        isLoadingPage = true;
        requestNextPage();
      });
    } else {
      setState(() {
        isLoadingPage = false;
      });
    }
  }

  void requestNextPage() async {
    late List<MovieModel> newList;
    switch (widget.movieListType) {
      case MovieListType.upComing:
        newList = await MoviesController().getUpComingMovies(page: page);
        break;
      case MovieListType.topRated:
        newList = await MoviesController().getTopRatedMovies(page: page);
        break;
      default:
        () {};
        break;
    }
    setState(() {
      fullList.addAll(newList);
      fullListLength = fullList.length;
      isLoadingPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: GridView.builder(
        itemCount: fullList.length + (isLoadingPage ? 1 : 0),
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          if (index >= fullList.length) {
            return const LoadingPosterWidget();
          }
          return MovieItemWidget(
            movie: fullList[index],
          );
        },
      ),
    );
  }
}
