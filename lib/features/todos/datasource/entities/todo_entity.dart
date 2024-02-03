class TodoEntity {
  TodoEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    return TodoEntity(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  TodoEntity copyWith({required String id}) {
    return TodoEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
    );
  }

  final String id;
  final String title;
  final bool isCompleted;
}
