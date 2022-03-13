import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenberg/view_models/search_view_model.dart';
import 'package:gutenberg/widgets/book_card.dart';
import 'package:gutenberg/widgets/search_box.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(title),
      lazy: false,
      child: Searchscreen(title: title),
    );
  }
}

class Searchscreen extends StatefulWidget {
  const Searchscreen({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final searchBoxController = TextEditingController();
  final gridScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    gridScrollController.addListener(() {
      if (gridScrollController.position.maxScrollExtent -
              gridScrollController.position.pixels <=
          10) {
        context.read<SearchViewModel>().setStatus(status.loadData);
      }
    });
  }

  @override
  void dispose() {
    searchBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SearchViewModel searchViewModel = context.watch<SearchViewModel>();
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            body: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    height: 140,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: constraints.maxWidth,
                          height: 60,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                icon: RotatedBox(
                                  quarterTurns: 2,
                                  child: SvgPicture.asset(
                                    'assets/icons/Next.svg',
                                    width: 25,
                                  ),
                                ),
                              ),
                              Text(
                                widget.title,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SearchBox(
                          searchBoxController: searchBoxController,
                          onPressed: () {
                            if (searchBoxController.value.text.isNotEmpty) {
                              searchViewModel.searchBooks(
                                widget.title,
                                searchBoxController.value.text,
                              );
                            } else {
                              searchViewModel.getBooks(
                                widget.title,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Consumer<SearchViewModel>(
                    builder: ((context, value, child) {
                      if (value.currentState == status.loadData) {
                        value.nextBooks(value.nextResult);
                      }
                      if (value.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (value.bookList != null) {
                        if (value.bookList!.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          );
                        }
                        return Positioned(
                          top: 150,
                          left: 10,
                          child: SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            child: GridView.builder(
                              controller: gridScrollController,
                              itemCount: value.bookList!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 235,
                              ),
                              itemBuilder: (context, index) {
                                var book = value.bookList![index];
                                int len = book.authors!.length;
                                String authorName = '';
                                for (int i = len - 1; i >= 0; i--) {
                                  authorName =
                                      authorName + book.authors![i].name;
                                }

                                return BookCard(
                                  author: authorName,
                                  title: book.title,
                                  imageUrl: book.formats!.imageJpeg,
                                  formats: book.formats!,
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: TextButton(
                              onPressed: () {
                                searchViewModel.getBooks(widget.title);
                              },
                              child: Text(
                                'Reload',
                                style: Theme.of(context).textTheme.button,
                              )),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
