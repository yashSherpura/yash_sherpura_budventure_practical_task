import 'package:injector/injector.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_interactor.dart';
import 'package:yash_sherpura_budventure_task/presentation/Search_screen/cubit/Search_cubit.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/cubit/home_cubit.dart';

class BlocModule {
  static HomeCubit createHomeCubit(Injector injector) {
    return HomeCubit(movieInteractor: injector.get<MovieInteractor>());
  }

  static SearchCubit createSearchCubit(Injector injector) {
    return SearchCubit(movieInteractor: injector.get<MovieInteractor>());
  }
}
