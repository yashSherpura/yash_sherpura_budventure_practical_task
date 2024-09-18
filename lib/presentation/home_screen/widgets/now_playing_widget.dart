import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/spacings.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/components/text_label.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key, required this.resultList});

  final List<ResultModel> resultList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: resultList.isEmpty
          ? const Center(
              child: TextLabel(
                text: StringConstants.noDataFound,
                maxLines: 1,
                overflow: TextOverflow.visible,
                textStyle: TextStyle(color: Palette.greyColor),
              ),
            )
          : ListView.builder(
              itemCount: resultList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * .4,
                  margin:
                      const EdgeInsets.only(right: Spacings.cardBorderRadius),
                  decoration: BoxDecoration(
                      color: Palette.greyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(Spacings.small)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Spacings.small),
                    child: Image.network(
                      StringConstants.networkImagePath +
                          resultList[index].posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
    );
  }
}
