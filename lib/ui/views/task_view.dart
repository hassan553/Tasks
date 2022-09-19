import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/task_cubit.dart';
import 'add_task.dart';
import 'home_view.dart';
import '../../constants/app_color.dart';
import '../../constants/constants.dart';
import '../../constants/global_method.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TaskCubit.get(context);
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: AppColors.mainColor,
              ),
              onPressed: () {
                pop(context: context);
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            height: getScreenSize(context: context).height,
            width: getScreenSize(context: context).width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/addtask.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: checkOrientation(context: context) ? 0 : 30,
              ),
              child: Column(
                children: [
                  Spacer(
                    flex: checkOrientation(context: context) ? 3 : 6,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          navigationAndEnd(
                              context: context, screen: const HomeView());
                        },
                        icon: Icon(
                          Icons.home,
                          color: AppColors.secondaryColor,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          navigationTo(context: context, screen: AddTaskView());
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.list_alt_rounded,
                        color: AppColors.secondaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        cubit.tasks.length.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 7,
                    child: ConditionalBuilder(
                      condition: cubit.tasks.isNotEmpty,
                      fallback: (context) =>
                          const Center(child: Text('empty....no task today')),
                      builder: (context) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.tasks.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              cubit.deleteData(cubit.tasks[index]['id']);
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerLeft,
                              child: const Icon(
                                Icons.delete,
                                size: 30,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: SingleChildScrollView(
                                          child: Text(
                                            cubit.tasks[index]['descrption']
                                                .toString(),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          onPressed: () {
                                            pop(context: context);
                                          },
                                          child: const Text('close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.all(4),
                                color: AppColors.textHolder,
                                child: Text(
                                  cubit.tasks[index]['title'].toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
