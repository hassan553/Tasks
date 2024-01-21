import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_tasks/feature/task/data/data_source/data.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  LocalDataSource localDataSource;
  TaskCubit(this.localDataSource) : super(TaskInitial());
  static TaskCubit get(context) => BlocProvider.of(context);
  dynamic database;
  void create() async {
    localDataSource.create();
  }

  List<Map> tasks = [];
  void insert({
    String title = '',
    String description = '',
  }) async {
    await localDataSource
        .insert(title: title, description: description)
        .then((value) {
      getData();
      emit(InsertAppData());
    }).catchError((onError) {});
  }

  void getData() async {
    tasks = await localDataSource.getData();
    emit(GetAppData());
  }

  void deleteData(id) {
    localDataSource.deleteData(id: id);
    getData();
    emit(DeleteAppData());
  }

  void updateData({
    String? title,
    String? description,
    int? id,
  }) {
    localDataSource.updateData(description: description, id: id, title: title);
    getData();
    emit(UpdateAppData());
  }
}
