import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/feature/task/data/data_source/data.dart';

import '../feature/task/presentation/cubit/task_cubit.dart';
import '../feature/task/presentation/view/home_view.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(LocalDataSource())..create(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        home: HomeView(),
      ),
    );
  }
}
