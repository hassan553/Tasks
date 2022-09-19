import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
   static TaskCubit get(context) => BlocProvider.of(context);
  dynamic database;
  void create() async {
    database = await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
          'create table task (title text,id integer primary key,descrption text )',
        )
            .then((value) {
          print('create database Task  successfully ');
          emit(CreateAppData());
        }).catchError(
          (onError) {
            print(onError.toString());
          },
        );
      },
      onOpen: (database) {
        getData(database);
        emit(GetAppData());
      },
    );
  }

  List<Map> tasks = [];
  void insert({
  String  title='',
   String descrption='',
  }) async {
    database.transaction((txn) async {
      return await txn.rawInsert(
          'insert into task (title,descrption) values ("$title","$descrption")');
    }).then((value) {
      print(value);
      getData(database);
      emit(InsertAppData());
      emit(GetAppData());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void getData(database) async {
    await database.rawQuery('select * from task').then((value) {
      print('i get data successfully ');
      tasks = value;
      emit(GetAppData());
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void deleteData(id) {
    database.rawDelete('delete from task where id =? ', ['$id']).then((value) {
      print('delete successfully');
      getData(database);
      emit(DeleteAppData());
      emit(GetAppData());
    }).catchError((onError) {
      print('error in delete ');
    });
  }

  void updateData({
    var title,
    var descrption,
    int? id,
  }) {
    database.rawUpdate(
      'UPDATE sale set title=?,descrption=? WHERE id=? ',
      ["$title", "$descrption", id],
    ).then((value) {
      getData(database);
      emit(UpdateAppData());
    });
  }
}
