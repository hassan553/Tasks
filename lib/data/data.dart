import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? database;
  void create() async {
    database = await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
          'create table task (title text,id integer primary key,descrption text)',
        )
            .then((value) {
          print('create database products  successfully ');
        }).catchError(
          (onError) {
            print(onError.toString());
          },
        );
      },
      onOpen: (database) {
        getData(database);
      },
    );
  }

  insert({
    title,
    descrption,
  }) async {
    await database?.transaction((txn) async {
      await txn.rawInsert(
          'insert into task (title,descrption ) values ("$title","$descrption")');
    }).then((value) {
      print('errror');
      getData(database);
    });

  }

  List<Map> tasks = [];
  void getData(database) async {
    await database?.rawQuery('select * from task').then((value) {
      print('i get data successfully ');
      tasks = value;
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void deleteData({id}) {
    database?.rawDelete('delete from task where id =? ', ['$id']).then((value) {
      print('delete successfully');
      getData(database);
    }).catchError((onError) {
      print('error in delete ');
    });
  }

  void updateData({
    var title,
    var descrption,
    int? id,
  }) {
    database?.rawUpdate(
      'UPDATE task set title=?,descrption=?, WHERE id=? ',
      ["$title", "$descrption", id],
    ).then((value) {
      getData(database);
    });
  }
}
