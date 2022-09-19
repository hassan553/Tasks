import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/data/data.dart';
import 'package:flutter_tasks/ui/widgets/flutter_toast.dart';
import 'package:flutter_tasks/view_model/cubit/task_cubit.dart';
import '../../constants/global_method.dart';
import '../widgets/build_button.dart';
import '../widgets/build_text_field.dart';

import '../../constants/app_color.dart';
import '../../constants/constants.dart';

class AddTaskView extends StatefulWidget {
  AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is InsertAppData) {
          showToast(message: 'add task successfully ');
        }
      },
      builder: (context, state) => Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
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
                  horizontal: checkOrientation(context: context) ? 10 : 50),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Spacer(
                      flex: checkOrientation(context: context) ? 3 : 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: CustomTextField(
                        
                        controller: titleController,
                        hint: 'Title',
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Not Valid Empty Value";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: getScreenSize(context: context).height * .02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: CustomTextField(
                        controller: descriptionController,
                        hint: 'Descrption',
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Not Valid Empty Value";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: getScreenSize(context: context).height * .07,
                    ),
                    BuildButton(
                      color: AppColors.mainColor,
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          TaskCubit.get(context).insert(
                            descrption: descriptionController.text,
                            title: titleController.text,
                          );
                        }
                      },
                      text: 'Add',
                      textColor: Colors.white,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
