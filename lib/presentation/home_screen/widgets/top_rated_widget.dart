import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key, required this.topRatedResultList});

  final List<ResultModel> topRatedResultList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .19,
      child: topRatedResultList.isEmpty
          ? const Center(
              child: TextLabel(
                text: StringConstants.noDataFound,
                maxLines: 1,
                overflow: TextOverflow.visible,
                textStyle: TextStyle(color: Palette.greyColor),
              ),
            )
          : ListView.builder(
              itemCount: topRatedResultList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: Spacings.cardBorderRadius),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .15,
                            width: MediaQuery.of(context).size.width * .5,
                            decoration: BoxDecoration(
                                color: Palette.greyColor,
                                borderRadius:
                                    BorderRadius.circular(Spacings.small)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(Spacings.small),
                              child: Image.network(
                                StringConstants.networkImagePath +
                                    topRatedResultList[index].posterPath,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: Spacings.mini,
                        ),
                        TextLabel(
                          text: topRatedResultList[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          textStyle: const TextStyle(color: Palette.greyColor),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
