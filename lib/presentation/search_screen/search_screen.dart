import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:yash_sherpura_budventure_task/injector.dart';
import 'package:yash_sherpura_budventure_task/presentation/Search_screen/cubit/Search_cubit.dart';
import 'package:yash_sherpura_budventure_task/presentation/search_screen/widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IOC>(
      builder: (BuildContext context, IOC ioc, Widget? child) {
        return BlocProvider<SearchCubit>(
          create: (BuildContext context) => ioc.getDependency<SearchCubit>(),
          child: const SearchWidget(),
        );
      },
    );
  }
}
