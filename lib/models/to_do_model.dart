class ToDo {
  dynamic title;
  dynamic descrption;
  ToDo({required this.title, this.descrption});
  ToDo.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    descrption = json['descrption'];
  }
  Map<String, String> toJson() {
    Map<String, String> m = {};

    m['title'] = title;
    m['descrption'] = descrption;
    return m;
  }
}
