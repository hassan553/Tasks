part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class CreateAppData extends TaskState {}

class GetAppData extends TaskState {}

class InsertAppData extends TaskState {}

class DeleteAppData extends TaskState {}

class UpdateAppData extends TaskState {}
