import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:yash_sherpura_budventure_task/injector.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/cubit/home_cubit.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IOC>(
      builder: (BuildContext context, IOC ioc, Widget? child) {
        return BlocProvider<HomeCubit>(
          create: (BuildContext context) => ioc.getDependency<HomeCubit>(),
          child: const HomeWidget(),
        );
      },
    );
  }
}
