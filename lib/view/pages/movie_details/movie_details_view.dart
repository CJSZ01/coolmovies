import 'package:coolmovies/core/models/movie.dart';
import 'package:coolmovies/core/models/review.dart';
import 'package:coolmovies/core/view_state_enum.dart';
import 'package:coolmovies/view/components/base_app_bar.dart';
import 'package:coolmovies/view/components/base_view.dart';
import 'package:coolmovies/view/components/review_dialog/review_dialog.dart';
import 'package:coolmovies/view/pages/movie_details/components/movie_reviews_list.dart';
import 'package:coolmovies/view/pages/movie_details/movie_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      viewModelBuilder: () => MovieDetailsViewModel(
        movie: movie,
        graphQLClient: GraphQLProvider.of(context).value,
      ),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        switch (model.viewState) {
          case ViewState.LOADING:
            return const BaseView.loading();
          case ViewState.ERROR:
            return BaseView.error(
              errorMessage: 'Ocorreu um erro ao carregar este filme.',
            );
          case ViewState.SUCCESS:
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: Row(
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ReviewDialog(
                              movie: movie,
                              onReviewCreated: (review) {
                                model.addReview(review);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              appBar: BaseAppBar(title: model.movie.title),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Center(
                            child: Image.network(
                              model.movie.imgUrl,
                              height: 300,
                            ),
                          ),
                          const Divider(),
                          RichText(
                            text: TextSpan(
                              text: 'Data de lançamento: ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: <TextSpan>[
                                TextSpan(
                                  text: model.movie.releaseDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          RichText(
                            text: TextSpan(
                              text: 'Diretor: ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: <TextSpan>[
                                TextSpan(
                                  text: model.movie.directorName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          MovieReviewsList(
                            movie: movie,
                            reviews: model.reviews,
                            onReviewEdited: (index, newReview) {
                              model.updateReview(index, newReview);
                            },
                            onReviewDeleted: (int index, Review deletedReview) {
                              model.deleteReview(deletedReview, index);
                            },
                          ),
                          const SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
        }
      },
    );
  }
}
