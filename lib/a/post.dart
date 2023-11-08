class Post{
  int? userId;
  int? id;
  String? title;
  String? body;

  Post.fromJson(dynamic json){
    userId = json["user id"];
    id = json["id"];
    title= json["title"];
    body= json["title"];
  }
}