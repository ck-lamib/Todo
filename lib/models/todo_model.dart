List<Todo> todosFromJson(List<dynamic> todosJson) => todosJson
    .map(
      (todoJson) => Todo.fromJson(todoJson),
    )
    .toList();

class Todo {
  int? id;
  String? todo;
  String? completed;
  String? userId;
  bool isFavourite = false;

  Todo({this.id, this.todo, this.completed, this.userId});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed']?.toString();
    userId = json['userId']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = todo;
    data['completed'] = completed;
    data['userId'] = userId;
    return data;
  }
}
