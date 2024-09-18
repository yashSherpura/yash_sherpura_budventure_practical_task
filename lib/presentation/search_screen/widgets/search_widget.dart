import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/errors.dart';
import 'package:yash_sherpura_budventure_task/presentation/Search_screen/cubit/Search_cubit.dart';
import 'package:yash_sherpura_budventure_task/presentation/Search_screen/cubit/Search_state.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_navigator.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_routes.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/app_scaffold.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/circular_progress_bar.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/app_bar_custom.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_field.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchCubit searchCubit;

  @override
  void initState() {
    searchCubit = BlocProvider.of<SearchCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        header: const AppBarCustom(title: StringConstants.labelSearch),
        body: BlocConsumer(
          bloc: searchCubit,
          listener: (context, state) {
            if (state is ErrorSearchState) {
              final String error = mapError(state.error);
              Utility.showCenterFlash(message: error, context: context);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Spacings.medium, right: Spacings.medium),
                  child: Column(
                    children: [
                      TextEditField(
                        context: context,
                        controller: searchCubit.searchController,
                        prefixTextWidget: const Icon(Icons.search),
                        suffixTextWidget: GestureDetector(
                            onTap: () {
                              searchCubit.searchController.clear();
                              searchCubit.refreshData();
                            },
                            child: const Icon(Icons.close)),
                        contentPadding: EdgeInsets.zero,
                        onTextChanged: (String value) {
                          searchCubit.searchMovie(
                              query: searchCubit.searchController.text);
                        },
                      ),
                      if (searchCubit.searchController.text.isEmpty)
                        const Expanded(
                          child: Center(
                            child: TextLabel(
                              text: StringConstants.labelSearchMovie,
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              textStyle: TextStyle(color: Palette.greyColor),
                            ),
                          ),
                        )
                      else if (searchCubit.resultList.isEmpty)
                        const Expanded(
                          child: Center(
                            child: TextLabel(
                              text: StringConstants.noDataFound,
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              textStyle: TextStyle(color: Palette.greyColor),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: searchCubit.resultList.length,
                              itemBuilder: (context, index) {
                                String formattedDate = DateFormat('yyyy')
                                    .format(searchCubit
                                        .resultList[index].releaseDate);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        AppNavigator.of(context).push(
                                          AppRoutes.movieDetailsScreen(
                                            movieData: searchCubit
                                                .resultList[index]
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: TextLabel(
                                          text: searchCubit
                                              .resultList[index].title,
                                          textStyle: TextStyles.titleMedium(),
                                        ),
                                        subtitle: TextLabel(
                                          text: formattedDate,
                                        ),
                                        trailing:
                                            const Icon(Icons.arrow_forward_ios),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: Spacings.mini,
                                    ),
                                  ],
                                );
                              }),
                        )
                    ],
                  ),
                ),
                if (state is LoadingSearchState) const CircularProgressBar()
              ],
            );
          },
        ));
  }
}
