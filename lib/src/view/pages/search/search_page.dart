import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/src/controller/movies_controller.dart';
import 'package:movies_app/src/model/movie_model.dart';
import 'package:movies_app/src/view/widgets/movie_item_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  final List<MovieModel> _movieList = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _searchMovie(String name) async {
    final searchedList = await MoviesController().getMovieByName(name);
    _movieList.clear();
    setState(() {
      _movieList.addAll(searchedList);
    });
  }

  void _onTextFieldChange(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 1500), () {
      _searchMovie(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColorLight.withOpacity(0.2),
                ),
                child: TextFormField(
                  controller: _controller,
                  cursorColor: Theme.of(context).primaryColorLight,
                  decoration: const InputDecoration(
                    label: Text('Search'),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onFieldSubmitted: (value) {
                    _searchMovie(value);
                  },
                  onChanged: _onTextFieldChange,
                ),
              ),
              _movieList.isEmpty
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.movie_creation_outlined,
                            size: 100,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          Text(
                            "No Movies on the List",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: _movieList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return MovieItemWidget(
                            movie: _movieList[index],
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
