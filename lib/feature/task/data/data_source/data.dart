import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  Database? database;
  void create() async {
    database = await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
              'create table task (title text,id integer primary key,description text)',
            )
            .then((value) {})
            .catchError(
              (onError) {},
            );
      },
      onOpen: (database) {
        getData();
      },
    );
  }

  insert({required String title, required String description}) async {
    await database?.transaction((txn) async {
      await txn.rawInsert(
          'insert into task (title,description ) values ("$title","$description")');
    }).then((value) {
      getData();
    });
  }

  List<Map> tasks = [];
  Future<List<Map>> getData() async {
    await database?.rawQuery('select * from task').then((value) {
      tasks = value;
    }).catchError((onError) {});
    return tasks;
  }

  void deleteData({id}) {
    database?.rawDelete('delete from task where id =? ', ['$id']).then((value) {
      getData();
    }).catchError((onError) {});
  }

  void updateData({
    var title,
    var description,
    int? id,
  }) {
    database?.rawUpdate(
      'UPDATE task set title=?,description=?, WHERE id=? ',
      ["$title", "$description", id],
    ).then((value) {
      getData();
    });
  }
}
