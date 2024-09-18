import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_navigator.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/text_styles.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/app_scaffold.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({super.key, required this.movieData});

  final ResultModel movieData;

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              AppNavigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        // header:  AppBarCustom(title: widget.movieData.title,titleMaxLine: 2,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Spacings.medium),
                child: TextLabel(
                  text: widget.movieData.title,
                  maxLines: 2,
                  textStyle: TextStyles.titleMedium(size: 22),
                ),
              ),
              const SizedBox(
                height: Spacings.small,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  StringConstants.networkImagePath +
                      widget.movieData.posterPath,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Spacings.medium, vertical: Spacings.medium),
                child: TextLabel(
                  text: widget.movieData.overview,
                ),
              ),
            ],
          ),
        ));
  }
}
