class TodoEntity {
  TodoEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    return TodoEntity(
      id: json['id'] as int,
      isCompleted: json['title'],
      title: json['isCompleted'],
    );
  }
  final int id;
  final String title;
  final bool isCompleted;
}
