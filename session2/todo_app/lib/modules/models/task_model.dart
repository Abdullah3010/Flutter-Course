class TaskModel {
  int? id;
  final String name;
  final String description;
  final bool isDone;

  TaskModel({
    this.id,
    required this.name,
    required this.description,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isDone: json['isDone'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'isDone': isDone ? 1 : 0,
    };
  }
}
