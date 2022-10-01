// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals
// use in first methods
class Autogenerated {
  int? userId;
  int? id;
  String? title;
  String? body;

  Autogenerated({this.userId, this.id, this.title, this.body});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}