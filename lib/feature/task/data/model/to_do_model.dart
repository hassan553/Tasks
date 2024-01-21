class TaskModel {
  dynamic title;
  dynamic description;
  TaskModel({required this.title, this.description});
  TaskModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
  Map<String, String> toJson() {
    Map<String, String> m = {};

    m['title'] = title;
    m['description'] = description;
    return m;
  }
}
