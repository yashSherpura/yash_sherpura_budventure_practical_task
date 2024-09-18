import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import 'package:yash_sherpura_budventure_task/data/movie/mapper/movie_mapper.dart';
import 'package:yash_sherpura_budventure_task/data/network/api/api_client.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_interactor.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_provider.dart';
import 'package:yash_sherpura_budventure_task/module/bloc_module.dart';
import 'package:yash_sherpura_budventure_task/module/data_module.dart';
import 'package:yash_sherpura_budventure_task/module/domain_module.dart';
import 'package:yash_sherpura_budventure_task/module/network_module.dart';
import 'package:yash_sherpura_budventure_task/presentation/Search_screen/cubit/Search_cubit.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/cubit/home_cubit.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class IOC {
  IOC.appScope() : parent = null {
    _initDependencies();
  }

  IOC.appScopeTest({void Function(Injector injector)? builder})
      : parent = null {
    if (builder != null) {
      builder(injector);
    }
  }

  @visibleForTesting
  final Injector injector = Injector();
  final List<DisposableDependency> _disposables = <DisposableDependency>[];
  final IOC? parent;

  void _initDependencies() {
    //Data API
    _registerSingleton<Dio>(NetworkModule.createDio);
    _registerSingleton<ApiClient>(NetworkModule.createApiClient);

    //Mapper
    _registerDependency<MovieMapper>(DataModule.createNowPlayingMapper);

    //Provider
    _registerSingleton<MovieProvider>(DataModule.movieProvider);

    //Interactor
    _registerSingleton<MovieInteractor>(
      DomainModule.createMovieInteractor,
    );

    //Bloc
    _registerDependency<HomeCubit>(BlocModule.createHomeCubit);
    _registerDependency<SearchCubit>(BlocModule.createSearchCubit);
  }

  void _registerSingleton<T>(
    DependencyBuilder<T> builder, {
    bool override = false,
    String dependencyName = '',
  }) {
    injector.registerSingleton<T>(
      () {
        final T instance = builder(injector);
        if (instance is DisposableDependency) {
          _disposables.add(instance);
        }
        return instance;
      },
      override: override,
      dependencyName: dependencyName,
    );
  }

  void _registerDependency<T>(
    DependencyBuilder<T> builder, {
    bool override = false,
    String dependencyName = '',
  }) {
    injector.registerDependency<T>(
      () {
        final T instance = builder(injector);
        if (instance is DisposableDependency) {
          _disposables.add(instance);
        }
        return instance;
      },
      override: override,
      dependencyName: dependencyName,
    );
  }

  T getDependency<T>({String dependencyName = ''}) {
    try {
      if (exists<T>()) {
        return injector.get<T>(dependencyName: dependencyName);
      } else if (parent?.exists() ?? false) {
        return parent!.getDependency<T>(dependencyName: dependencyName);
      } else {
        throw 'Type not defined $T';
      }
    } catch (e) {
      Utility.showLog('Error: $e');
      throw 'Type not defined $T';
    }
  }

  bool exists<T>({String dependencyName = ''}) {
    return injector.exists<T>(dependencyName: dependencyName);
  }

  void dispose() {
    for (final DisposableDependency disposable in _disposables) {
      disposable.dispose();
    }
  }
}

typedef DependencyBuilder<T> = T Function(Injector injector);

abstract class DisposableDependency {
  void dispose();
}

class InjectorWidget<T extends Object> extends StatelessWidget {
  const InjectorWidget({super.key, required this.builder});

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<IOC>(
      builder: (BuildContext context, IOC value, Widget? child) =>
          builder(context, value.getDependency<T>()),
    );
  }
}
