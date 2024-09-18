import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/errors.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/cubit/home_cubit.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/cubit/home_state.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/widgets/now_playing_widget.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/widgets/top_rated_widget.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/widgets/upcoming_widget.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/app_scaffold.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/circular_progress_bar.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/app_bar_custom.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.nowPlayingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        header: const AppBarCustom(title: StringConstants.appName),
        body: BlocConsumer(
          bloc: homeCubit,
          listener: (context, HomeState state) {
            if (state is ErrorHomeState) {
              final String error = mapError(state.error);
              Utility.showCenterFlash(message: error, context: context);
            } else if (state is SuccessNowPlayingHomeState) {
              homeCubit.upComingMovie();
            } else if(state is SuccessUpComingHomeState){
              homeCubit.topRatedMovie();
            }
          },
          builder: (context, HomeState state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: Spacings.medium),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextLabel(
                          text: StringConstants.labelNowPlaying,
                          textStyle: TextStyles.titleMedium(size: 20),
                        ),
                        const SizedBox(height: Spacings.small),
                        NowPlayingWidget(resultList: homeCubit.resultList),
                        const SizedBox(height: Spacings.custom20),
                        TextLabel(
                          text: StringConstants.labelUpcoming,
                          textStyle: TextStyles.titleMedium(size: 20),
                        ),
                        const SizedBox(
                          height: Spacings.small,
                        ),
                        UpcomingWidget(
                            upComingResultList: homeCubit.upComingResultList),
                        const SizedBox(height: Spacings.custom20),
                        TextLabel(
                          text: StringConstants.labelTopRated,
                          textStyle: TextStyles.titleMedium(size: 20),
                        ),
                        const SizedBox(
                          height: Spacings.small,
                        ),
                        TopRatedWidget(
                          topRatedResultList: homeCubit.topRatedResultList
                        )
                      ],
                    ),
                  ),
                ),
                if (state is LoadingHomeState) const CircularProgressBar(),
              ],
            );
          },
        ));
  }
}
