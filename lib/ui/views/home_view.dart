import 'package:flutter/material.dart';
import 'package:flutter_tasks/data/data.dart';

import '../../constants/app_color.dart';
import '../../constants/global_method.dart';
import 'add_task.dart';
import 'task_view.dart';
import '../widgets/build_button.dart';


import '../../constants/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppDatabase().create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getScreenSize(context: context).height,
        width: getScreenSize(context: context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/welcome.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                'Hello',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4,
                ),
              ),
              Text(
                'start your beautiful day',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(
                flex: 10,
              ),
              BuildButton(
                color: AppColors.mainColor,
                function: () {
                  navigationTo(
                    context: context,
                    screen: AddTaskView(),
                  );
               
                },
                text: 'Add Task',
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              BuildButton(
                color: Colors.white,
                function: () {
                  navigationTo(
                    context: context,
                    screen: const TaskView(),
                  );

                
                },
                text: 'View All',
                textColor: AppColors.mainColor,
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
